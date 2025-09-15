import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sample_book_app/domain/entities/book_entity.dart';

part 'book_detail_view_state.freezed.dart';

@freezed
class BookDetailViewState with _$BookDetailViewState {
  const factory BookDetailViewState({
    BookEntity? book,
    @Default(false) bool isLoading,
    String? error,
  }) = _BookDetailViewState;
}