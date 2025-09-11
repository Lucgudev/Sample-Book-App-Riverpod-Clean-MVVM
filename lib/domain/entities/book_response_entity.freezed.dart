// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_response_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BookResponseEntity _$BookResponseEntityFromJson(Map<String, dynamic> json) {
  return _BookResponseEntity.fromJson(json);
}

/// @nodoc
mixin _$BookResponseEntity {
  int get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  List<BookEntity> get results => throw _privateConstructorUsedError;

  /// Serializes this BookResponseEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BookResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookResponseEntityCopyWith<BookResponseEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookResponseEntityCopyWith<$Res> {
  factory $BookResponseEntityCopyWith(
    BookResponseEntity value,
    $Res Function(BookResponseEntity) then,
  ) = _$BookResponseEntityCopyWithImpl<$Res, BookResponseEntity>;
  @useResult
  $Res call({
    int count,
    String? next,
    String? previous,
    List<BookEntity> results,
  });
}

/// @nodoc
class _$BookResponseEntityCopyWithImpl<$Res, $Val extends BookResponseEntity>
    implements $BookResponseEntityCopyWith<$Res> {
  _$BookResponseEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = null,
  }) {
    return _then(
      _value.copyWith(
            count:
                null == count
                    ? _value.count
                    : count // ignore: cast_nullable_to_non_nullable
                        as int,
            next:
                freezed == next
                    ? _value.next
                    : next // ignore: cast_nullable_to_non_nullable
                        as String?,
            previous:
                freezed == previous
                    ? _value.previous
                    : previous // ignore: cast_nullable_to_non_nullable
                        as String?,
            results:
                null == results
                    ? _value.results
                    : results // ignore: cast_nullable_to_non_nullable
                        as List<BookEntity>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BookResponseEntityImplCopyWith<$Res>
    implements $BookResponseEntityCopyWith<$Res> {
  factory _$$BookResponseEntityImplCopyWith(
    _$BookResponseEntityImpl value,
    $Res Function(_$BookResponseEntityImpl) then,
  ) = __$$BookResponseEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int count,
    String? next,
    String? previous,
    List<BookEntity> results,
  });
}

/// @nodoc
class __$$BookResponseEntityImplCopyWithImpl<$Res>
    extends _$BookResponseEntityCopyWithImpl<$Res, _$BookResponseEntityImpl>
    implements _$$BookResponseEntityImplCopyWith<$Res> {
  __$$BookResponseEntityImplCopyWithImpl(
    _$BookResponseEntityImpl _value,
    $Res Function(_$BookResponseEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BookResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = null,
  }) {
    return _then(
      _$BookResponseEntityImpl(
        count:
            null == count
                ? _value.count
                : count // ignore: cast_nullable_to_non_nullable
                    as int,
        next:
            freezed == next
                ? _value.next
                : next // ignore: cast_nullable_to_non_nullable
                    as String?,
        previous:
            freezed == previous
                ? _value.previous
                : previous // ignore: cast_nullable_to_non_nullable
                    as String?,
        results:
            null == results
                ? _value._results
                : results // ignore: cast_nullable_to_non_nullable
                    as List<BookEntity>,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$BookResponseEntityImpl implements _BookResponseEntity {
  const _$BookResponseEntityImpl({
    required this.count,
    this.next,
    this.previous,
    required final List<BookEntity> results,
  }) : _results = results;

  factory _$BookResponseEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookResponseEntityImplFromJson(json);

  @override
  final int count;
  @override
  final String? next;
  @override
  final String? previous;
  final List<BookEntity> _results;
  @override
  List<BookEntity> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'BookResponseEntity(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookResponseEntityImpl &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.previous, previous) ||
                other.previous == previous) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    count,
    next,
    previous,
    const DeepCollectionEquality().hash(_results),
  );

  /// Create a copy of BookResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookResponseEntityImplCopyWith<_$BookResponseEntityImpl> get copyWith =>
      __$$BookResponseEntityImplCopyWithImpl<_$BookResponseEntityImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BookResponseEntityImplToJson(this);
  }
}

abstract class _BookResponseEntity implements BookResponseEntity {
  const factory _BookResponseEntity({
    required final int count,
    final String? next,
    final String? previous,
    required final List<BookEntity> results,
  }) = _$BookResponseEntityImpl;

  factory _BookResponseEntity.fromJson(Map<String, dynamic> json) =
      _$BookResponseEntityImpl.fromJson;

  @override
  int get count;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  List<BookEntity> get results;

  /// Create a copy of BookResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookResponseEntityImplCopyWith<_$BookResponseEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
