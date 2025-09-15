import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sample_book_app/domain/entities/book_entity.dart';
import 'package:sample_book_app/domain/entities/author_entity.dart';

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

  factory TopicBooksViewState.dummyState(String topic) {
    final dummyBooks = List.generate(
      8,
      (index) => BookEntity(
        id: index,
        title: 'Lorem ipsum dolor sit amet consectetur adipiscing elit',
        authors: [
          const AuthorEntity(
            name: 'John Doe Author Name',
            birthYear: 1980,
            deathYear: null,
          ),
        ],
        summaries: ['Mock summary for skeleton loading'],
        translators: [],
        subjects: ['Fiction', 'Adventure'],
        bookshelves: ['Popular Books'],
        languages: ['en'],
        copyright: false,
        mediaType: 'text',
        formats: {
          'image/jpeg': 'https://via.placeholder.com/150x200',
        },
        downloadCount: 1000,
      ),
    );
    
    return TopicBooksViewState(
      books: dummyBooks,
      isLoading: true,
      currentPage: 1,
      topic: topic,
    );
  }
}