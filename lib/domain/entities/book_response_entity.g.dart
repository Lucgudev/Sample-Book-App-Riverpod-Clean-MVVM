// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookResponseEntityImpl _$$BookResponseEntityImplFromJson(
  Map<String, dynamic> json,
) => _$BookResponseEntityImpl(
  count: (json['count'] as num).toInt(),
  next: json['next'] as String?,
  previous: json['previous'] as String?,
  results:
      (json['results'] as List<dynamic>)
          .map((e) => BookEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$$BookResponseEntityImplToJson(
  _$BookResponseEntityImpl instance,
) => <String, dynamic>{
  'count': instance.count,
  'next': instance.next,
  'previous': instance.previous,
  'results': instance.results,
};
