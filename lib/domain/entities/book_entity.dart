import 'package:freezed_annotation/freezed_annotation.dart';
import 'author_entity.dart';

part 'book_entity.freezed.dart';
part 'book_entity.g.dart';

@freezed
class BookEntity with _$BookEntity {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory BookEntity({
    required int id,
    required String title,
    required List<AuthorEntity> authors,
    required List<String> summaries,
    required List<AuthorEntity> translators,
    required List<String> subjects,
    required List<String> bookshelves,
    required List<String> languages,
    required bool copyright,
    required String mediaType,
    required Map<String, String> formats,
    required int downloadCount,
  }) = _BookEntity;

  factory BookEntity.fromJson(Map<String, dynamic> json) =>
      _$BookEntityFromJson(json);
}
