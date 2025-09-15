import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/book_entity.dart';

part 'topic_books_view_state.freezed.dart';

@freezed
class TopicBooksViewState with _$TopicBooksViewState {
  const factory TopicBooksViewState({
    @Default([]) List<BookEntity> books,
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingMore,
    @Default(1) int currentPage,
    @Default(false) bool hasMore,
    String? error,
    String? topic,
  }) = _TopicBooksViewState;
}