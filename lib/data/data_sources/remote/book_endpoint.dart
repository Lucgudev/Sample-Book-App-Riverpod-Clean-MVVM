import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sample_book_app/core/provider/global_provider.dart';
import 'package:sample_book_app/domain/entities/book_response_entity.dart';

part 'book_endpoint.g.dart';

@riverpod
BookEndpoint bookEndpoint(BookEndpointRef ref) {
  return BookEndpoint(dio: ref.read(dioProvider));
}

class BookEndpoint {
  final Dio dio;

  BookEndpoint({required this.dio});

  Future<BookResponseEntity> fetchBooks({int page = 1, String? search}) async {
    final response = await dio.get(
      '/books/',
      queryParameters: {
        'page': page,
        if (search != null && search.isNotEmpty) 'search': search,
      },
    );

    return BookResponseEntity.fromJson(response.data);
  }
}
