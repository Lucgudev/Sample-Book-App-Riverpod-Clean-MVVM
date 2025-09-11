// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthorEntityImpl _$$AuthorEntityImplFromJson(Map<String, dynamic> json) =>
    _$AuthorEntityImpl(
      name: json['name'] as String,
      birthYear: (json['birth_year'] as num?)?.toInt(),
      deathYear: (json['death_year'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$AuthorEntityImplToJson(_$AuthorEntityImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'birth_year': instance.birthYear,
      'death_year': instance.deathYear,
    };
