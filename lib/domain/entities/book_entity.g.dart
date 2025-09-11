// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookEntityImpl _$$BookEntityImplFromJson(Map<String, dynamic> json) =>
    _$BookEntityImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      authors:
          (json['authors'] as List<dynamic>)
              .map((e) => AuthorEntity.fromJson(e as Map<String, dynamic>))
              .toList(),
      summaries:
          (json['summaries'] as List<dynamic>).map((e) => e as String).toList(),
      translators:
          (json['translators'] as List<dynamic>)
              .map((e) => AuthorEntity.fromJson(e as Map<String, dynamic>))
              .toList(),
      subjects:
          (json['subjects'] as List<dynamic>).map((e) => e as String).toList(),
      bookshelves:
          (json['bookshelves'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
      languages:
          (json['languages'] as List<dynamic>).map((e) => e as String).toList(),
      copyright: json['copyright'] as bool,
      mediaType: json['media_type'] as String,
      formats: Map<String, String>.from(json['formats'] as Map),
      downloadCount: (json['download_count'] as num).toInt(),
    );

Map<String, dynamic> _$$BookEntityImplToJson(_$BookEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'authors': instance.authors,
      'summaries': instance.summaries,
      'translators': instance.translators,
      'subjects': instance.subjects,
      'bookshelves': instance.bookshelves,
      'languages': instance.languages,
      'copyright': instance.copyright,
      'media_type': instance.mediaType,
      'formats': instance.formats,
      'download_count': instance.downloadCount,
    };
