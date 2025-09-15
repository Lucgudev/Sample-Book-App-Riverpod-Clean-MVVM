import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_book_app/domain/entities/book_response_entity.dart';
import 'package:sample_book_app/domain/entities/book_entity.dart';
import 'package:sample_book_app/domain/entities/author_entity.dart';
import 'package:sample_book_app/data/repositories/book_repository_impl.dart';
import 'package:sample_book_app/presentation/screens/topic_books/topic_books_view_model.dart';
import 'package:sample_book_app/presentation/screens/topic_books/topic_books_view_state.dart';

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

  group('TopicBooksViewModel', () {
    test('initial state should be correct', () {
      final viewModel = container.read(topicBooksViewModelProvider.notifier);
      final state = container.read(topicBooksViewModelProvider);

      expect(state, const TopicBooksViewState());
      expect(state.books, isEmpty);
      expect(state.isLoading, false);
      expect(state.isLoadingMore, false);
      expect(state.currentPage, 1);
      expect(state.hasMore, false);
      expect(state.error, null);
      expect(state.topic, null);
    });

    test(
      'fetchBooksByTopic should update state to loading then success',
      () async {
        // Arrange
        const topic = 'Science Fiction';
        final mockBooks = [
          const BookEntity(
            id: 1,
            title: 'Sci-Fi Book 1',
            authors: [
              AuthorEntity(
                name: 'Sci-Fi Author 1',
                birthYear: 1980,
                deathYear: null,
              ),
            ],
            summaries: ['A great sci-fi story'],
            translators: [],
            subjects: ['Science Fiction', 'Adventure'],
            bookshelves: ['Science Fiction', 'Popular'],
            languages: ['en'],
            copyright: false,
            mediaType: 'text',
            formats: {'text/html': 'http://example.com/scifi1'},
            downloadCount: 500,
          ),
          const BookEntity(
            id: 2,
            title: 'Sci-Fi Book 2',
            authors: [
              AuthorEntity(
                name: 'Sci-Fi Author 2',
                birthYear: 1990,
                deathYear: null,
              ),
            ],
            summaries: ['Another great sci-fi story'],
            translators: [],
            subjects: ['Science Fiction', 'Space'],
            bookshelves: ['Science Fiction', 'Bestsellers'],
            languages: ['en'],
            copyright: false,
            mediaType: 'text',
            formats: {'text/html': 'http://example.com/scifi2'},
            downloadCount: 750,
          ),
        ];

        final mockResponse = BookResponseEntity(
          count: 2,
          next: 'http://example.com/next',
          previous: null,
          results: mockBooks,
        );

        when(
          mockRepository.fetchBooksByTopic(topic: topic, page: 1),
        ).thenAnswer((_) async => mockResponse);

        final viewModel = container.read(topicBooksViewModelProvider.notifier);

        // Act
        await viewModel.fetchBooksByTopic(topic);

        // Assert
        final state = container.read(topicBooksViewModelProvider);
        expect(state.books, mockBooks);
        expect(state.isLoading, false);
        expect(state.currentPage, 1);
        expect(state.hasMore, true);
        expect(state.error, null);
        expect(state.topic, topic);

        verify(
          mockRepository.fetchBooksByTopic(topic: topic, page: 1),
        ).called(1);
      },
    );

    test('fetchBooksByTopic should handle error correctly', () async {
      // Arrange
      const topic = 'Science Fiction';
      const errorMessage = 'Network error';
      when(
        mockRepository.fetchBooksByTopic(topic: topic, page: 1),
      ).thenThrow(Exception(errorMessage));

      final viewModel = container.read(topicBooksViewModelProvider.notifier);

      // Act
      await viewModel.fetchBooksByTopic(topic);

      // Assert - After error, the dummy books remain (similar to HomeViewModel behavior)
      final state = container.read(topicBooksViewModelProvider);
      expect(state.books, isNotEmpty); // Dummy books remain from dummyState()
      expect(state.isLoading, false);
      expect(state.error, 'Exception: $errorMessage');

      verify(mockRepository.fetchBooksByTopic(topic: topic, page: 1)).called(1);
    });

    test(
      'fetchBooksByTopic with loadMore should append books to existing list',
      () async {
        // Arrange
        const topic = 'Fantasy';
        final existingBooks = [
          const BookEntity(
            id: 1,
            title: 'Existing Fantasy Book',
            authors: [
              AuthorEntity(
                name: 'Fantasy Author',
                birthYear: 1980,
                deathYear: null,
              ),
            ],
            summaries: ['Existing fantasy story'],
            translators: [],
            subjects: ['Fantasy'],
            bookshelves: ['Fantasy', 'Popular'],
            languages: ['en'],
            copyright: false,
            mediaType: 'text',
            formats: {'text/html': 'http://example.com/fantasy1'},
            downloadCount: 300,
          ),
        ];

        final newBooks = [
          const BookEntity(
            id: 2,
            title: 'New Fantasy Book',
            authors: [
              AuthorEntity(
                name: 'New Fantasy Author',
                birthYear: 1990,
                deathYear: null,
              ),
            ],
            summaries: ['New fantasy story'],
            translators: [],
            subjects: ['Fantasy', 'Magic'],
            bookshelves: ['Fantasy', 'Bestsellers'],
            languages: ['en'],
            copyright: false,
            mediaType: 'text',
            formats: {'text/html': 'http://example.com/fantasy2'},
            downloadCount: 400,
          ),
        ];

        final mockResponse = BookResponseEntity(
          count: 2,
          next: null,
          previous: null,
          results: newBooks,
        );

        when(
          mockRepository.fetchBooksByTopic(topic: topic, page: 2),
        ).thenAnswer((_) async => mockResponse);

        final viewModel = container.read(topicBooksViewModelProvider.notifier);

        // Set initial state manually
        container
            .read(topicBooksViewModelProvider.notifier)
            .state = TopicBooksViewState(
          books: existingBooks,
          currentPage: 1,
          hasMore: true,
          topic: topic,
        );

        // Act
        await viewModel.fetchBooksByTopic(topic, loadMore: true);

        // Assert
        final state = container.read(topicBooksViewModelProvider);
        expect(state.books.length, 2);
        expect(state.books[0], existingBooks[0]);
        expect(state.books[1], newBooks[0]);
        expect(state.isLoadingMore, false);
        expect(state.currentPage, 2);
        expect(state.hasMore, false);

        verify(
          mockRepository.fetchBooksByTopic(topic: topic, page: 2),
        ).called(1);
      },
    );

    test('clearError should remove error from state', () {
      // Arrange
      final viewModel = container.read(topicBooksViewModelProvider.notifier);

      // Set initial state with error
      container
          .read(topicBooksViewModelProvider.notifier)
          .state = const TopicBooksViewState(error: 'Test error');

      // Act
      viewModel.clearError();

      // Assert
      final state = container.read(topicBooksViewModelProvider);
      expect(state.error, null);
    });

    test('loadMore should set isLoadingMore to true during request', () async {
      // Arrange
      const topic = 'History';
      final viewModel = container.read(topicBooksViewModelProvider.notifier);

      // Set initial state
      container
          .read(topicBooksViewModelProvider.notifier)
          .state = const TopicBooksViewState(
        books: [],
        currentPage: 1,
        hasMore: true,
        topic: topic,
      );

      final mockResponse = BookResponseEntity(
        count: 1,
        next: null,
        previous: null,
        results: [
          const BookEntity(
            id: 1,
            title: 'History Book',
            authors: [
              AuthorEntity(
                name: 'History Author',
                birthYear: 1980,
                deathYear: null,
              ),
            ],
            summaries: ['Historical narrative'],
            translators: [],
            subjects: ['History'],
            bookshelves: ['History', 'Educational'],
            languages: ['en'],
            copyright: false,
            mediaType: 'text',
            formats: {'text/html': 'http://example.com/history1'},
            downloadCount: 200,
          ),
        ],
      );

      when(mockRepository.fetchBooksByTopic(topic: topic, page: 2)).thenAnswer((
        _,
      ) async {
        // Verify isLoadingMore is set during the request
        final currentState = container.read(topicBooksViewModelProvider);
        expect(currentState.isLoadingMore, true);
        return mockResponse;
      });

      // Act
      await viewModel.fetchBooksByTopic(topic, loadMore: true);

      // Assert
      final finalState = container.read(topicBooksViewModelProvider);
      expect(finalState.isLoadingMore, false);
    });

    test(
      'fetchBooksByTopic should handle no more results (hasMore = false)',
      () async {
        // Arrange
        const topic = 'Poetry';
        final mockBooks = [
          const BookEntity(
            id: 1,
            title: 'Poetry Collection',
            authors: [
              AuthorEntity(name: 'Poet', birthYear: 1950, deathYear: 2000),
            ],
            summaries: ['Beautiful poems'],
            translators: [],
            subjects: ['Poetry'],
            bookshelves: ['Poetry', 'Literature'],
            languages: ['en'],
            copyright: false,
            mediaType: 'text',
            formats: {'text/html': 'http://example.com/poetry1'},
            downloadCount: 150,
          ),
        ];

        final mockResponse = BookResponseEntity(
          count: 1,
          next: null, // No next page
          previous: null,
          results: mockBooks,
        );

        when(
          mockRepository.fetchBooksByTopic(topic: topic, page: 1),
        ).thenAnswer((_) async => mockResponse);

        final viewModel = container.read(topicBooksViewModelProvider.notifier);

        // Act
        await viewModel.fetchBooksByTopic(topic);

        // Assert
        final state = container.read(topicBooksViewModelProvider);
        expect(state.books, mockBooks);
        expect(state.hasMore, false); // Should be false when next is null
        expect(state.currentPage, 1);

        verify(
          mockRepository.fetchBooksByTopic(topic: topic, page: 1),
        ).called(1);
      },
    );

    test(
      'fetchBooksByTopic with different topics should work correctly',
      () async {
        // Arrange
        const topic1 = 'Science';
        const topic2 = 'Art';

        final scienceBooks = [
          const BookEntity(
            id: 1,
            title: 'Science Book',
            authors: [
              AuthorEntity(name: 'Scientist', birthYear: 1970, deathYear: null),
            ],
            summaries: ['Scientific discovery'],
            translators: [],
            subjects: ['Science'],
            bookshelves: ['Science', 'Educational'],
            languages: ['en'],
            copyright: false,
            mediaType: 'text',
            formats: {'text/html': 'http://example.com/science1'},
            downloadCount: 600,
          ),
        ];

        final artBooks = [
          const BookEntity(
            id: 2,
            title: 'Art History',
            authors: [
              AuthorEntity(
                name: 'Art Historian',
                birthYear: 1960,
                deathYear: null,
              ),
            ],
            summaries: ['History of art'],
            translators: [],
            subjects: ['Art', 'History'],
            bookshelves: ['Art', 'History'],
            languages: ['en'],
            copyright: false,
            mediaType: 'text',
            formats: {'text/html': 'http://example.com/art1'},
            downloadCount: 400,
          ),
        ];

        final scienceResponse = BookResponseEntity(
          count: 1,
          next: null,
          previous: null,
          results: scienceBooks,
        );

        final artResponse = BookResponseEntity(
          count: 1,
          next: null,
          previous: null,
          results: artBooks,
        );

        when(
          mockRepository.fetchBooksByTopic(topic: topic1, page: 1),
        ).thenAnswer((_) async => scienceResponse);
        when(
          mockRepository.fetchBooksByTopic(topic: topic2, page: 1),
        ).thenAnswer((_) async => artResponse);

        final viewModel = container.read(topicBooksViewModelProvider.notifier);

        // Act - Fetch science books first
        await viewModel.fetchBooksByTopic(topic1);

        // Assert science books
        var state = container.read(topicBooksViewModelProvider);
        expect(state.books, scienceBooks);
        expect(state.topic, topic1);

        // Act - Fetch art books
        await viewModel.fetchBooksByTopic(topic2);

        // Assert art books (should replace science books)
        state = container.read(topicBooksViewModelProvider);
        expect(state.books, artBooks);
        expect(state.topic, topic2);

        verify(
          mockRepository.fetchBooksByTopic(topic: topic1, page: 1),
        ).called(1);
        verify(
          mockRepository.fetchBooksByTopic(topic: topic2, page: 1),
        ).called(1);
      },
    );
  });
}
