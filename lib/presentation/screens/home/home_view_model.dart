import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../data/repositories/book_repository_impl.dart';
import 'home_view_state.dart';

part 'home_view_model.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  @override
  HomeViewState build() {
    return const HomeViewState();
  }

  Future<void> fetchBooks({bool loadMore = false}) async {
    if (loadMore) {
      state = state.copyWith(isLoadingMore: true);
    } else {
      state = HomeViewState.dummyState();
    }

    try {
      final repository = ref.read(bookRepositoryProvider);
      final response = await repository.fetchBooks(
        page: loadMore ? state.currentPage + 1 : 1,
        search: state.searchQuery,
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

  void searchBooks(String query) {
    state = state.copyWith(searchQuery: query.isEmpty ? null : query);
    fetchBooks();
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}
