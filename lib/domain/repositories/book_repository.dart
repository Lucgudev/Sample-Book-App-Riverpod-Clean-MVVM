import 'package:sample_book_app/domain/entities/book_response_entity.dart';
import 'package:sample_book_app/domain/entities/book_entity.dart';

abstract class BookRepository {
  Future<BookResponseEntity> fetchBooks({
    int page = 1,
    String? search,
  });

  Future<BookEntity> fetchBookDetail(int bookId);
}