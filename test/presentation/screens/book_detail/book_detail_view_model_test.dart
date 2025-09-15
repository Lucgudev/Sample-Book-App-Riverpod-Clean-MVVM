import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_book_app/domain/entities/book_entity.dart';
import 'package:sample_book_app/domain/entities/author_entity.dart';
import 'package:sample_book_app/data/repositories/book_repository_impl.dart';
import 'package:sample_book_app/presentation/screens/book_detail/book_detail_view_model.dart';
import 'package:sample_book_app/presentation/screens/book_detail/book_detail_view_state.dart';

import '../../app_mock.mocks.dart';

void main() {
  late MockBookRepository mockRepository;
  late ProviderContainer container;

  setUp(() {
    mockRepository = MockBookRepository();
    container = ProviderContainer(
      overrides: [bookRepositoryProvider.overrideWithValue(mockRepository)],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('BookDetailViewModel', () {
    test('initial state should be correct', () {
      final viewModel = container.read(bookDetailViewModelProvider.notifier);
      final state = container.read(bookDetailViewModelProvider);

      expect(state, const BookDetailViewState());
      expect(state.book, null);
      expect(state.isLoading, false);
      expect(state.error, null);
    });

    test(
      'loadBookDetail with bookData should set book directly without API call',
      () async {
        // Arrange
        const bookId = 1;
        const bookData = BookEntity(
          id: 1,
          title: 'Direct Book Data',
          authors: [
            AuthorEntity(
              name: 'Direct Author',
              birthYear: 1985,
              deathYear: null,
            ),
          ],
          summaries: ['Book provided directly'],
          translators: [],
          subjects: ['Fiction', 'Drama'],
          bookshelves: ['Popular', 'Fiction'],
          languages: ['en'],
          copyright: false,
          mediaType: 'text',
          formats: {
            'text/html': 'http://example.com/direct-book.html',
            'application/epub+zip': 'http://example.com/direct-book.epub',
          },
          downloadCount: 1500,
        );

        final viewModel = container.read(bookDetailViewModelProvider.notifier);

        // Act
        await viewModel.loadBookDetail(bookId, bookData: bookData);

        // Assert
        final state = container.read(bookDetailViewModelProvider);
        expect(state.book, bookData);
        expect(state.isLoading, false);
        expect(state.error, null);

        // Verify no API call was made
        verifyNever(mockRepository.fetchBookDetail(any));
      },
    );

    test(
      'loadBookDetail without bookData should fetch from API successfully',
      () async {
        // Arrange
        const bookId = 2;
        const mockBook = BookEntity(
          id: 2,
          title: 'API Fetched Book',
          authors: [
            AuthorEntity(
              name: 'API Author 1',
              birthYear: 1970,
              deathYear: null,
            ),
            AuthorEntity(
              name: 'API Author 2',
              birthYear: 1980,
              deathYear: 2020,
            ),
          ],
          summaries: ['Book fetched from API', 'Additional summary'],
          translators: [
            AuthorEntity(
              name: 'Translator Name',
              birthYear: 1975,
              deathYear: null,
            ),
          ],
          subjects: ['Science', 'Technology', 'Innovation'],
          bookshelves: ['Science', 'Technology', 'Bestsellers'],
          languages: ['en', 'es'],
          copyright: true,
          mediaType: 'text',
          formats: {
            'text/html': 'http://example.com/api-book.html',
            'application/pdf': 'http://example.com/api-book.pdf',
            'text/plain': 'http://example.com/api-book.txt',
          },
          downloadCount: 2500,
        );

        when(
          mockRepository.fetchBookDetail(bookId),
        ).thenAnswer((_) async => mockBook);

        final viewModel = container.read(bookDetailViewModelProvider.notifier);

        // Act
        await viewModel.loadBookDetail(bookId);

        // Assert
        final state = container.read(bookDetailViewModelProvider);
        expect(state.book, mockBook);
        expect(state.isLoading, false);
        expect(state.error, null);

        verify(mockRepository.fetchBookDetail(bookId)).called(1);
      },
    );

    test('loadBookDetail without bookData should handle API error', () async {
      // Arrange
      const bookId = 3;
      const errorMessage = 'Book not found';
      when(
        mockRepository.fetchBookDetail(bookId),
      ).thenThrow(Exception(errorMessage));

      final viewModel = container.read(bookDetailViewModelProvider.notifier);

      // Act
      await viewModel.loadBookDetail(bookId);

      // Assert - After error, the dummy book remains (similar to HomeViewModel behavior)
      final state = container.read(bookDetailViewModelProvider);
      expect(state.book, isNotNull); // Dummy book remains from dummyState()
      expect(state.isLoading, false);
      expect(state.error, 'Exception: $errorMessage');

      verify(mockRepository.fetchBookDetail(bookId)).called(1);
    });

    test('clearError should remove error from state', () {
      // Arrange
      final viewModel = container.read(bookDetailViewModelProvider.notifier);

      // Set initial state with error
      container
          .read(bookDetailViewModelProvider.notifier)
          .state = const BookDetailViewState(error: 'Test error');

      // Act
      viewModel.clearError();

      // Assert
      final state = container.read(bookDetailViewModelProvider);
      expect(state.error, null);
    });

    test(
      'loadBookDetail without bookData should set loading state during API call',
      () async {
        // Arrange
        const bookId = 4;
        const mockBook = BookEntity(
          id: 4,
          title: 'Loading Test Book',
          authors: [
            AuthorEntity(
              name: 'Loading Author',
              birthYear: 1990,
              deathYear: null,
            ),
          ],
          summaries: ['Testing loading state'],
          translators: [],
          subjects: ['Testing'],
          bookshelves: ['Test Books'],
          languages: ['en'],
          copyright: false,
          mediaType: 'text',
          formats: {'text/html': 'http://example.com/loading-test.html'},
          downloadCount: 100,
        );

        when(mockRepository.fetchBookDetail(bookId)).thenAnswer((_) async {
          // Verify loading state is set during the API call
          final currentState = container.read(bookDetailViewModelProvider);
          expect(currentState.isLoading, true);
          return mockBook;
        });

        final viewModel = container.read(bookDetailViewModelProvider.notifier);

        // Act
        await viewModel.loadBookDetail(bookId);

        // Assert
        final finalState = container.read(bookDetailViewModelProvider);
        expect(finalState.book, mockBook);
        expect(finalState.isLoading, false);

        verify(mockRepository.fetchBookDetail(bookId)).called(1);
      },
    );

    test(
      'loadBookDetail with bookData should clear any existing error',
      () async {
        // Arrange
        const bookId = 5;
        const bookData = BookEntity(
          id: 5,
          title: 'Error Clearing Book',
          authors: [
            AuthorEntity(
              name: 'Error Clear Author',
              birthYear: 1988,
              deathYear: null,
            ),
          ],
          summaries: ['Book for testing error clearing'],
          translators: [],
          subjects: ['Testing'],
          bookshelves: ['Test Suite'],
          languages: ['en'],
          copyright: false,
          mediaType: 'text',
          formats: {'text/html': 'http://example.com/error-clear.html'},
          downloadCount: 50,
        );

        final viewModel = container.read(bookDetailViewModelProvider.notifier);

        // Set initial state with error
        container
            .read(bookDetailViewModelProvider.notifier)
            .state = const BookDetailViewState(error: 'Previous error');

        // Act
        await viewModel.loadBookDetail(bookId, bookData: bookData);

        // Assert
        final state = container.read(bookDetailViewModelProvider);
        expect(state.book, bookData);
        expect(state.error, null); // Error should be cleared
        expect(state.isLoading, false);
      },
    );

    test('multiple loadBookDetail calls should work correctly', () async {
      // Arrange
      const bookId1 = 6;
      const bookId2 = 7;

      const book1 = BookEntity(
        id: 6,
        title: 'First Book',
        authors: [
          AuthorEntity(name: 'First Author', birthYear: 1975, deathYear: null),
        ],
        summaries: ['First book summary'],
        translators: [],
        subjects: ['First Genre'],
        bookshelves: ['First Shelf'],
        languages: ['en'],
        copyright: false,
        mediaType: 'text',
        formats: {'text/html': 'http://example.com/first.html'},
        downloadCount: 300,
      );

      const book2 = BookEntity(
        id: 7,
        title: 'Second Book',
        authors: [
          AuthorEntity(name: 'Second Author', birthYear: 1985, deathYear: null),
        ],
        summaries: ['Second book summary'],
        translators: [],
        subjects: ['Second Genre'],
        bookshelves: ['Second Shelf'],
        languages: ['en'],
        copyright: false,
        mediaType: 'text',
        formats: {'text/html': 'http://example.com/second.html'},
        downloadCount: 450,
      );

      when(
        mockRepository.fetchBookDetail(bookId1),
      ).thenAnswer((_) async => book1);
      when(
        mockRepository.fetchBookDetail(bookId2),
      ).thenAnswer((_) async => book2);

      final viewModel = container.read(bookDetailViewModelProvider.notifier);

      // Act - Load first book
      await viewModel.loadBookDetail(bookId1);

      // Assert first book
      var state = container.read(bookDetailViewModelProvider);
      expect(state.book, book1);

      // Act - Load second book
      await viewModel.loadBookDetail(bookId2);

      // Assert second book (should replace first book)
      state = container.read(bookDetailViewModelProvider);
      expect(state.book, book2);
      expect(state.error, null);
      expect(state.isLoading, false);

      verify(mockRepository.fetchBookDetail(bookId1)).called(1);
      verify(mockRepository.fetchBookDetail(bookId2)).called(1);
    });

    test(
      'loadBookDetail with null bookData should still make API call',
      () async {
        // Arrange
        const bookId = 8;
        const mockBook = BookEntity(
          id: 8,
          title: 'Null Data Test Book',
          authors: [
            AuthorEntity(
              name: 'Null Test Author',
              birthYear: 1992,
              deathYear: null,
            ),
          ],
          summaries: ['Testing null bookData parameter'],
          translators: [],
          subjects: ['Testing'],
          bookshelves: ['Unit Tests'],
          languages: ['en'],
          copyright: false,
          mediaType: 'text',
          formats: {'text/html': 'http://example.com/null-test.html'},
          downloadCount: 25,
        );

        when(
          mockRepository.fetchBookDetail(bookId),
        ).thenAnswer((_) async => mockBook);

        final viewModel = container.read(bookDetailViewModelProvider.notifier);

        // Act - Explicitly pass null bookData
        await viewModel.loadBookDetail(bookId, bookData: null);

        // Assert
        final state = container.read(bookDetailViewModelProvider);
        expect(state.book, mockBook);
        expect(state.isLoading, false);
        expect(state.error, null);

        verify(mockRepository.fetchBookDetail(bookId)).called(1);
      },
    );
  });
}
