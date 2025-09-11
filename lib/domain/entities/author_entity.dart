import 'package:freezed_annotation/freezed_annotation.dart';

part 'author_entity.freezed.dart';
part 'author_entity.g.dart';

@freezed
class AuthorEntity with _$AuthorEntity {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory AuthorEntity({
    required String name,
    int? birthYear,
    int? deathYear,
  }) = _AuthorEntity;

  factory AuthorEntity.fromJson(Map<String, dynamic> json) =>
      _$AuthorEntityFromJson(json);
}
