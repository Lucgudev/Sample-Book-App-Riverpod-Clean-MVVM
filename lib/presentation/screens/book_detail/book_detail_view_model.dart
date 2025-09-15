import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sample_book_app/data/repositories/book_repository_impl.dart';
import 'package:sample_book_app/domain/entities/book_entity.dart';
import 'book_detail_view_state.dart';

part 'book_detail_view_model.g.dart';

@riverpod
class BookDetailViewModel extends _$BookDetailViewModel {
  @override
  BookDetailViewState build() {
    return const BookDetailViewState();
  }

  Future<void> loadBookDetail(int bookId, {BookEntity? bookData}) async {
    // If book data is already provided, use it directly
    if (bookData != null) {
      state = state.copyWith(
        book: bookData,
        isLoading: false,
        error: null,
      );
      return;
    }

    // Otherwise, fetch from API
    state = state.copyWith(isLoading: true, error: null);

    try {
      final repository = ref.read(bookRepositoryProvider);
      final book = await repository.fetchBookDetail(bookId);

      state = state.copyWith(
        book: book,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}