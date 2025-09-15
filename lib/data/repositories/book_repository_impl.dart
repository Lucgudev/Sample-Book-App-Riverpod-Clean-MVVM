import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sample_book_app/domain/entities/book_response_entity.dart';
import 'package:sample_book_app/domain/entities/book_entity.dart';
import 'package:sample_book_app/domain/repositories/book_repository.dart';
import 'package:sample_book_app/data/data_sources/remote/book_endpoint.dart';

part 'book_repository_impl.g.dart';

@riverpod
BookRepository bookRepository(BookRepositoryRef ref) {
  return BookRepositoryImpl(bookEndpoint: ref.read(bookEndpointProvider));
}

class BookRepositoryImpl implements BookRepository {
  final BookEndpoint bookEndpoint;

  BookRepositoryImpl({required this.bookEndpoint});

  @override
  Future<BookResponseEntity> fetchBooks({
    int page = 1,
    String? search,
  }) async {
    return await bookEndpoint.fetchBooks(
      page: page,
      search: search,
    );
  }

  @override
  Future<BookEntity> fetchBookDetail(int bookId) async {
    return await bookEndpoint.fetchBookDetail(bookId);
  }

  @override
  Future<BookResponseEntity> fetchBooksByTopic({
    required String topic,
    int page = 1,
  }) async {
    return await bookEndpoint.fetchBooksByTopic(
      topic: topic,
      page: page,
    );
  }
}