import 'package:freezed_annotation/freezed_annotation.dart';
import 'book_entity.dart';

part 'book_response_entity.freezed.dart';
part 'book_response_entity.g.dart';

@freezed
class BookResponseEntity with _$BookResponseEntity {
  const factory BookResponseEntity({
    required int count,
    String? next,
    String? previous,
    required List<BookEntity> results,
  }) = _BookResponseEntity;

  factory BookResponseEntity.fromJson(Map<String, dynamic> json) => _$BookResponseEntityFromJson(json);
}