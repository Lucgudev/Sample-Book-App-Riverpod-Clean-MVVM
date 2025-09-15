import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sample_book_app/presentation/widgets/generic_error_widget.dart';
import 'package:sample_book_app/presentation/widgets/book_list_item.dart';
import 'package:sample_book_app/presentation/widgets/empty_state_widget.dart';
import 'package:sample_book_app/domain/entities/book_entity.dart';
import 'package:sample_book_app/domain/entities/author_entity.dart';
import 'home_view_model.dart';
import 'home_view_state.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _scrollController = ScrollController();
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homeViewModelProvider.notifier).fetchBooks();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      final state = ref.read(homeViewModelProvider);
      if (state.hasMore && !state.isLoadingMore) {
        ref.read(homeViewModelProvider.notifier).fetchBooks(loadMore: true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Books',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          // Search Bar - hidden while loading
          if (!state.isLoading)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SearchBar(
                controller: _searchController,
                hintText: 'Search books...',
                leading: const Icon(Icons.search),
                trailing: [
                  if (_searchController.text.isNotEmpty)
                    IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _searchController.clear();
                        ref.read(homeViewModelProvider.notifier).searchBooks('');
                      },
                    ),
                ],
                onSubmitted: (value) {
                  ref.read(homeViewModelProvider.notifier).searchBooks(value);
                },
              ),
            ),
          // Book List
          Expanded(child: _buildBookList(state)),
        ],
      ),
    );
  }

  Widget _buildBookList(HomeViewState state) {
    if (state.error != null) {
      return GenericErrorWidget(
        errorMessage: state.error,
        onRetry: () {
          ref.read(homeViewModelProvider.notifier).clearError();
          ref.read(homeViewModelProvider.notifier).fetchBooks();
        },
      );
    }

    if (!state.isLoading && state.books.isEmpty) {
      return const EmptyStateWidget(
        icon: Icons.book_outlined,
        subtitle: 'No books found',
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
          return BookListItem(book: book);
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
