import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sample_book_app/presentation/widgets/generic_error_widget.dart';
import 'package:sample_book_app/presentation/widgets/book_list_item.dart';
import 'package:sample_book_app/presentation/widgets/empty_state_widget.dart';
import 'topic_books_view_model.dart';
import 'topic_books_view_state.dart';

class TopicBooksScreen extends ConsumerStatefulWidget {
  final String topic;
  
  const TopicBooksScreen({
    super.key,
    required this.topic,
  });

  @override
  ConsumerState<TopicBooksScreen> createState() => _TopicBooksScreenState();
}

class _TopicBooksScreenState extends ConsumerState<TopicBooksScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(topicBooksViewModelProvider.notifier).fetchBooksByTopic(widget.topic);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      final state = ref.read(topicBooksViewModelProvider);
      if (state.hasMore && !state.isLoadingMore) {
        ref.read(topicBooksViewModelProvider.notifier).fetchBooksByTopic(widget.topic, loadMore: true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(topicBooksViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Topic: ${widget.topic}'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: _buildBookList(state),
    );
  }

  Widget _buildBookList(TopicBooksViewState state) {
    if (state.error != null) {
      return GenericErrorWidget(
        errorMessage: state.error,
        onRetry: () {
          ref.read(topicBooksViewModelProvider.notifier).clearError();
          ref.read(topicBooksViewModelProvider.notifier).fetchBooksByTopic(widget.topic);
        },
      );
    }

    if (!state.isLoading && state.books.isEmpty) {
      return EmptyStateWidget(
        icon: Icons.book_outlined,
        subtitle: 'No books found for "${widget.topic}"',
      );
    }

    return Skeletonizer(
      enabled: state.isLoading,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: state.books.length + (state.hasMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == state.books.length) {
            return _buildLoadingIndicator();
          }

          final book = state.books[index];
          return BookListItem(
            book: book,
            showTopicInfo: true,
          );
        },
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Center(child: CircularProgressIndicator()),
    );
  }
}