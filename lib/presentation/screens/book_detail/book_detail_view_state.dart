import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sample_book_app/domain/entities/book_entity.dart';
import 'package:sample_book_app/domain/entities/author_entity.dart';

part 'book_detail_view_state.freezed.dart';

@freezed
class BookDetailViewState with _$BookDetailViewState {
  const factory BookDetailViewState({
    BookEntity? book,
    @Default(false) bool isLoading,
    String? error,
  }) = _BookDetailViewState;

  factory BookDetailViewState.dummyState() {
    final dummyBook = BookEntity(
      id: 0,
      title: 'Lorem Ipsum Dolor Sit Amet Consectetur Adipiscing Elit Sed Do Eiusmod',
      authors: [
        const AuthorEntity(
          name: 'John Doe Author Name',
          birthYear: 1980,
          deathYear: 2023,
        ),
        const AuthorEntity(
          name: 'Jane Smith Co-Author',
          birthYear: 1975,
          deathYear: null,
        ),
      ],
      summaries: [
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
      ],
      translators: [],
      subjects: ['Fiction', 'Adventure', 'Drama', 'Romance'],
      bookshelves: ['Popular Books', 'Bestsellers', 'Featured'],
      languages: ['en'],
      copyright: false,
      mediaType: 'text',
      formats: {
        'image/jpeg': 'https://via.placeholder.com/300x400',
        'text/html': 'https://example.com/book.html',
        'application/epub+zip': 'https://example.com/book.epub',
        'application/pdf': 'https://example.com/book.pdf',
        'text/plain': 'https://example.com/book.txt',
      },
      downloadCount: 15432,
    );
    
    return BookDetailViewState(
      book: dummyBook,
      isLoading: true,
    );
  }
}