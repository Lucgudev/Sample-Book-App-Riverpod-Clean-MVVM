import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/book_response_entity.dart';
import '../../domain/repositories/book_repository.dart';
import '../data_sources/remote/book_endpoint.dart';

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
}