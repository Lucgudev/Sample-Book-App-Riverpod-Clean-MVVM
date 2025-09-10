import '../entities/book_response_entity.dart';

abstract class BookRepository {
  Future<BookResponseEntity> fetchBooks({
    int page = 1,
    String? search,
  });
}