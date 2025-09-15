import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_book_app/domain/entities/book_response_entity.dart';
import 'package:sample_book_app/domain/entities/book_entity.dart';
import 'package:sample_book_app/domain/entities/author_entity.dart';
import 'package:sample_book_app/data/repositories/book_repository_impl.dart';
import 'package:sample_book_app/presentation/screens/home/home_view_model.dart';
import 'package:sample_book_app/presentation/screens/home/home_view_state.dart';

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

  group('HomeViewModel', () {
    test('initial state should be correct', () {
      final viewModel = container.read(homeViewModelProvider.notifier);
      final state = container.read(homeViewModelProvider);

      expect(state, const HomeViewState());
      expect(state.books, isEmpty);
      expect(state.isLoading, false);
      expect(state.isLoadingMore, false);
      expect(state.currentPage, 1);
      expect(state.hasMore, false);
      expect(state.error, null);
      expect(state.searchQuery, null);
    });

    test('fetchBooks should update state to loading then success', () async {
      // Arrange
      final mockBooks = [
        const BookEntity(
          id: 1,
          title: 'Test Book 1',
          authors: [
            AuthorEntity(name: 'Author 1', birthYear: 1980, deathYear: null),
          ],
          summaries: ['Test summary 1'],
          translators: [],
          subjects: ['Fiction'],
          bookshelves: ['Popular'],
          languages: ['en'],
          copyright: false,
          mediaType: 'text',
          formats: {'text/html': 'http://example.com/1'},
          downloadCount: 100,
        ),
        const BookEntity(
          id: 2,
          title: 'Test Book 2',
          authors: [
            AuthorEntity(name: 'Author 2', birthYear: 1990, deathYear: null),
          ],
          summaries: ['Test summary 2'],
          translators: [],
          subjects: ['Science'],
          bookshelves: ['Educational'],
          languages: ['en'],
          copyright: false,
          mediaType: 'text',
          formats: {'text/html': 'http://example.com/2'},
          downloadCount: 200,
        ),
      ];

      final mockResponse = BookResponseEntity(
        count: 2,
        next: 'http://example.com/next',
        previous: null,
        results: mockBooks,
      );

      when(
        mockRepository.fetchBooks(page: 1, search: null),
      ).thenAnswer((_) async => mockResponse);

      final viewModel = container.read(homeViewModelProvider.notifier);

      // Act
      await viewModel.fetchBooks();

      // Assert
      final state = container.read(homeViewModelProvider);
      expect(state.books, mockBooks);
      expect(state.isLoading, false);
      expect(state.currentPage, 1);
      expect(state.hasMore, true);
      expect(state.error, null);

      verify(mockRepository.fetchBooks(page: 1, search: null)).called(1);
    });

    test('fetchBooks should handle error correctly', () async {
      // Arrange
      const errorMessage = 'Network error';
      when(
        mockRepository.fetchBooks(page: 1, search: null),
      ).thenThrow(Exception(errorMessage));

      final viewModel = container.read(homeViewModelProvider.notifier);

      // Act
      await viewModel.fetchBooks();

      // Assert - After error, the dummy state books remain but loading is false and error is set
      final state = container.read(homeViewModelProvider);
      expect(
        state.books,
        isNotEmpty,
      ); // Dummy books remain from the initial loading state
      expect(
        state.books.length,
        8,
      ); // Should have 8 dummy books from dummyState()
      expect(state.isLoading, false);
      expect(state.error, 'Exception: $errorMessage');

      verify(mockRepository.fetchBooks(page: 1, search: null)).called(1);
    });

    test(
      'fetchBooks with loadMore should append books to existing list',
      () async {
        // Arrange - Set initial state with existing books
        final existingBooks = [
          const BookEntity(
            id: 1,
            title: 'Existing Book',
            authors: [
              AuthorEntity(
                name: 'Existing Author',
                birthYear: 1980,
                deathYear: null,
              ),
            ],
            summaries: ['Existing summary'],
            translators: [],
            subjects: ['Fiction'],
            bookshelves: ['Popular'],
            languages: ['en'],
            copyright: false,
            mediaType: 'text',
            formats: {'text/html': 'http://example.com/existing'},
            downloadCount: 50,
          ),
        ];

        final newBooks = [
          const BookEntity(
            id: 2,
            title: 'New Book',
            authors: [
              AuthorEntity(
                name: 'New Author',
                birthYear: 1990,
                deathYear: null,
              ),
            ],
            summaries: ['New summary'],
            translators: [],
            subjects: ['Science'],
            bookshelves: ['Educational'],
            languages: ['en'],
            copyright: false,
            mediaType: 'text',
            formats: {'text/html': 'http://example.com/new'},
            downloadCount: 75,
          ),
        ];

        final mockResponse = BookResponseEntity(
          count: 2,
          next: null,
          previous: null,
          results: newBooks,
        );

        when(
          mockRepository.fetchBooks(page: 2, search: null),
        ).thenAnswer((_) async => mockResponse);

        final viewModel = container.read(homeViewModelProvider.notifier);

        // Set initial state manually
        container.read(homeViewModelProvider.notifier).state = HomeViewState(
          books: existingBooks,
          currentPage: 1,
          hasMore: true,
        );

        // Act
        await viewModel.fetchBooks(loadMore: true);

        // Assert
        final state = container.read(homeViewModelProvider);
        expect(state.books.length, 2);
        expect(state.books[0], existingBooks[0]);
        expect(state.books[1], newBooks[0]);
        expect(state.isLoadingMore, false);
        expect(state.currentPage, 2);
        expect(state.hasMore, false);

        verify(mockRepository.fetchBooks(page: 2, search: null)).called(1);
      },
    );

    test('searchBooks with empty query should clear search', () async {
      // Arrange
      final mockResponse = BookResponseEntity(
        count: 0,
        next: null,
        previous: null,
        results: [],
      );

      when(
        mockRepository.fetchBooks(page: 1, search: null),
      ).thenAnswer((_) async => mockResponse);

      final viewModel = container.read(homeViewModelProvider.notifier);

      // Set initial state with search query
      container
          .read(homeViewModelProvider.notifier)
          .state = const HomeViewState(searchQuery: 'previous query');

      // Act
      viewModel.searchBooks('');

      // Check that searchQuery is cleared immediately (synchronously)
      final immediateState = container.read(homeViewModelProvider);
      expect(immediateState.searchQuery, null);

      // Wait a microtask for the async fetchBooks call to complete
      await Future.microtask(() {});

      // Assert final state
      final state = container.read(homeViewModelProvider);
      expect(state.searchQuery, null);

      verify(mockRepository.fetchBooks(page: 1, search: null)).called(1);
    });

    test('clearError should remove error from state', () {
      // Arrange
      final viewModel = container.read(homeViewModelProvider.notifier);

      // Set initial state with error
      container
          .read(homeViewModelProvider.notifier)
          .state = const HomeViewState(error: 'Test error');

      // Act
      viewModel.clearError();

      // Assert
      final state = container.read(homeViewModelProvider);
      expect(state.error, null);
    });

    test('loadMore should set isLoadingMore to true during request', () async {
      // Arrange
      final viewModel = container.read(homeViewModelProvider.notifier);

      // Set initial state
      container.read(homeViewModelProvider.notifier).state =
          const HomeViewState(books: [], currentPage: 1, hasMore: true);

      final mockResponse = BookResponseEntity(
        count: 1,
        next: null,
        previous: null,
        results: [
          const BookEntity(
            id: 1,
            title: 'Test Book',
            authors: [
              AuthorEntity(
                name: 'Test Author',
                birthYear: 1980,
                deathYear: null,
              ),
            ],
            summaries: ['Test summary'],
            translators: [],
            subjects: ['Fiction'],
            bookshelves: ['Popular'],
            languages: ['en'],
            copyright: false,
            mediaType: 'text',
            formats: {'text/html': 'http://example.com/1'},
            downloadCount: 100,
          ),
        ],
      );

      when(mockRepository.fetchBooks(page: 2, search: null)).thenAnswer((
        _,
      ) async {
        // Verify isLoadingMore is set during the request
        final currentState = container.read(homeViewModelProvider);
        expect(currentState.isLoadingMore, true);
        return mockResponse;
      });

      // Act
      await viewModel.fetchBooks(loadMore: true);

      // Assert
      final finalState = container.read(homeViewModelProvider);
      expect(finalState.isLoadingMore, false);
    });
  });
}
