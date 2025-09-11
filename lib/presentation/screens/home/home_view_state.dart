import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/book_entity.dart';

part 'home_view_state.freezed.dart';

@freezed
class HomeViewState with _$HomeViewState {
  const factory HomeViewState({
    @Default([]) List<BookEntity> books,
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingMore,
    @Default(1) int currentPage,
    @Default(false) bool hasMore,
    String? error,
    String? searchQuery,
  }) = _HomeViewState;
}