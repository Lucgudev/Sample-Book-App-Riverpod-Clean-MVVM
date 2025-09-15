import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sample_book_app/data/repositories/book_repository_impl.dart';
import 'package:sample_book_app/domain/entities/book_entity.dart';
import 'package:sample_book_app/domain/entities/author_entity.dart';
import 'topic_books_view_state.dart';

part 'topic_books_view_model.g.dart';

@riverpod
class TopicBooksViewModel extends _$TopicBooksViewModel {
  @override
  TopicBooksViewState build() {
    return const TopicBooksViewState();
  }


  Future<void> fetchBooksByTopic(String topic, {bool loadMore = false}) async {
    if (loadMore) {
      state = state.copyWith(isLoadingMore: true);
    } else {
      state = TopicBooksViewState.dummyState(topic);
    }

    try {
      final repository = ref.read(bookRepositoryProvider);
      final response = await repository.fetchBooksByTopic(
        topic: topic,
        page: loadMore ? state.currentPage + 1 : 1,
      );

      final newBooks = response.results;
      
      if (loadMore) {
        state = state.copyWith(
          books: [...state.books, ...newBooks],
          currentPage: state.currentPage + 1,
          isLoadingMore: false,
          hasMore: response.next != null,
        );
      } else {
        state = state.copyWith(
          books: newBooks,
          currentPage: 1,
          isLoading: false,
          hasMore: response.next != null,
        );
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        isLoadingMore: false,
        error: e.toString(),
      );
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}