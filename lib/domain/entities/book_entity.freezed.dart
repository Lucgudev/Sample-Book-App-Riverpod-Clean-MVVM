// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BookEntity _$BookEntityFromJson(Map<String, dynamic> json) {
  return _BookEntity.fromJson(json);
}

/// @nodoc
mixin _$BookEntity {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<AuthorEntity> get authors => throw _privateConstructorUsedError;
  List<String> get summaries => throw _privateConstructorUsedError;
  List<AuthorEntity> get translators => throw _privateConstructorUsedError;
  List<String> get subjects => throw _privateConstructorUsedError;
  List<String> get bookshelves => throw _privateConstructorUsedError;
  List<String> get languages => throw _privateConstructorUsedError;
  bool get copyright => throw _privateConstructorUsedError;
  String get mediaType => throw _privateConstructorUsedError;
  Map<String, String> get formats => throw _privateConstructorUsedError;
  int get downloadCount => throw _privateConstructorUsedError;

  /// Serializes this BookEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BookEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookEntityCopyWith<BookEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookEntityCopyWith<$Res> {
  factory $BookEntityCopyWith(
    BookEntity value,
    $Res Function(BookEntity) then,
  ) = _$BookEntityCopyWithImpl<$Res, BookEntity>;
  @useResult
  $Res call({
    int id,
    String title,
    List<AuthorEntity> authors,
    List<String> summaries,
    List<AuthorEntity> translators,
    List<String> subjects,
    List<String> bookshelves,
    List<String> languages,
    bool copyright,
    String mediaType,
    Map<String, String> formats,
    int downloadCount,
  });
}

/// @nodoc
class _$BookEntityCopyWithImpl<$Res, $Val extends BookEntity>
    implements $BookEntityCopyWith<$Res> {
  _$BookEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? authors = null,
    Object? summaries = null,
    Object? translators = null,
    Object? subjects = null,
    Object? bookshelves = null,
    Object? languages = null,
    Object? copyright = null,
    Object? mediaType = null,
    Object? formats = null,
    Object? downloadCount = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int,
            title:
                null == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String,
            authors:
                null == authors
                    ? _value.authors
                    : authors // ignore: cast_nullable_to_non_nullable
                        as List<AuthorEntity>,
            summaries:
                null == summaries
                    ? _value.summaries
                    : summaries // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            translators:
                null == translators
                    ? _value.translators
                    : translators // ignore: cast_nullable_to_non_nullable
                        as List<AuthorEntity>,
            subjects:
                null == subjects
                    ? _value.subjects
                    : subjects // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            bookshelves:
                null == bookshelves
                    ? _value.bookshelves
                    : bookshelves // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            languages:
                null == languages
                    ? _value.languages
                    : languages // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            copyright:
                null == copyright
                    ? _value.copyright
                    : copyright // ignore: cast_nullable_to_non_nullable
                        as bool,
            mediaType:
                null == mediaType
                    ? _value.mediaType
                    : mediaType // ignore: cast_nullable_to_non_nullable
                        as String,
            formats:
                null == formats
                    ? _value.formats
                    : formats // ignore: cast_nullable_to_non_nullable
                        as Map<String, String>,
            downloadCount:
                null == downloadCount
                    ? _value.downloadCount
                    : downloadCount // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BookEntityImplCopyWith<$Res>
    implements $BookEntityCopyWith<$Res> {
  factory _$$BookEntityImplCopyWith(
    _$BookEntityImpl value,
    $Res Function(_$BookEntityImpl) then,
  ) = __$$BookEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String title,
    List<AuthorEntity> authors,
    List<String> summaries,
    List<AuthorEntity> translators,
    List<String> subjects,
    List<String> bookshelves,
    List<String> languages,
    bool copyright,
    String mediaType,
    Map<String, String> formats,
    int downloadCount,
  });
}

/// @nodoc
class __$$BookEntityImplCopyWithImpl<$Res>
    extends _$BookEntityCopyWithImpl<$Res, _$BookEntityImpl>
    implements _$$BookEntityImplCopyWith<$Res> {
  __$$BookEntityImplCopyWithImpl(
    _$BookEntityImpl _value,
    $Res Function(_$BookEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BookEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? authors = null,
    Object? summaries = null,
    Object? translators = null,
    Object? subjects = null,
    Object? bookshelves = null,
    Object? languages = null,
    Object? copyright = null,
    Object? mediaType = null,
    Object? formats = null,
    Object? downloadCount = null,
  }) {
    return _then(
      _$BookEntityImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int,
        title:
            null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String,
        authors:
            null == authors
                ? _value._authors
                : authors // ignore: cast_nullable_to_non_nullable
                    as List<AuthorEntity>,
        summaries:
            null == summaries
                ? _value._summaries
                : summaries // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        translators:
            null == translators
                ? _value._translators
                : translators // ignore: cast_nullable_to_non_nullable
                    as List<AuthorEntity>,
        subjects:
            null == subjects
                ? _value._subjects
                : subjects // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        bookshelves:
            null == bookshelves
                ? _value._bookshelves
                : bookshelves // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        languages:
            null == languages
                ? _value._languages
                : languages // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        copyright:
            null == copyright
                ? _value.copyright
                : copyright // ignore: cast_nullable_to_non_nullable
                    as bool,
        mediaType:
            null == mediaType
                ? _value.mediaType
                : mediaType // ignore: cast_nullable_to_non_nullable
                    as String,
        formats:
            null == formats
                ? _value._formats
                : formats // ignore: cast_nullable_to_non_nullable
                    as Map<String, String>,
        downloadCount:
            null == downloadCount
                ? _value.downloadCount
                : downloadCount // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$BookEntityImpl implements _BookEntity {
  const _$BookEntityImpl({
    required this.id,
    required this.title,
    required final List<AuthorEntity> authors,
    required final List<String> summaries,
    required final List<AuthorEntity> translators,
    required final List<String> subjects,
    required final List<String> bookshelves,
    required final List<String> languages,
    required this.copyright,
    required this.mediaType,
    required final Map<String, String> formats,
    required this.downloadCount,
  }) : _authors = authors,
       _summaries = summaries,
       _translators = translators,
       _subjects = subjects,
       _bookshelves = bookshelves,
       _languages = languages,
       _formats = formats;

  factory _$BookEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookEntityImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  final List<AuthorEntity> _authors;
  @override
  List<AuthorEntity> get authors {
    if (_authors is EqualUnmodifiableListView) return _authors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_authors);
  }

  final List<String> _summaries;
  @override
  List<String> get summaries {
    if (_summaries is EqualUnmodifiableListView) return _summaries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_summaries);
  }

  final List<AuthorEntity> _translators;
  @override
  List<AuthorEntity> get translators {
    if (_translators is EqualUnmodifiableListView) return _translators;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_translators);
  }

  final List<String> _subjects;
  @override
  List<String> get subjects {
    if (_subjects is EqualUnmodifiableListView) return _subjects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subjects);
  }

  final List<String> _bookshelves;
  @override
  List<String> get bookshelves {
    if (_bookshelves is EqualUnmodifiableListView) return _bookshelves;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bookshelves);
  }

  final List<String> _languages;
  @override
  List<String> get languages {
    if (_languages is EqualUnmodifiableListView) return _languages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_languages);
  }

  @override
  final bool copyright;
  @override
  final String mediaType;
  final Map<String, String> _formats;
  @override
  Map<String, String> get formats {
    if (_formats is EqualUnmodifiableMapView) return _formats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_formats);
  }

  @override
  final int downloadCount;

  @override
  String toString() {
    return 'BookEntity(id: $id, title: $title, authors: $authors, summaries: $summaries, translators: $translators, subjects: $subjects, bookshelves: $bookshelves, languages: $languages, copyright: $copyright, mediaType: $mediaType, formats: $formats, downloadCount: $downloadCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._authors, _authors) &&
            const DeepCollectionEquality().equals(
              other._summaries,
              _summaries,
            ) &&
            const DeepCollectionEquality().equals(
              other._translators,
              _translators,
            ) &&
            const DeepCollectionEquality().equals(other._subjects, _subjects) &&
            const DeepCollectionEquality().equals(
              other._bookshelves,
              _bookshelves,
            ) &&
            const DeepCollectionEquality().equals(
              other._languages,
              _languages,
            ) &&
            (identical(other.copyright, copyright) ||
                other.copyright == copyright) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            const DeepCollectionEquality().equals(other._formats, _formats) &&
            (identical(other.downloadCount, downloadCount) ||
                other.downloadCount == downloadCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    const DeepCollectionEquality().hash(_authors),
    const DeepCollectionEquality().hash(_summaries),
    const DeepCollectionEquality().hash(_translators),
    const DeepCollectionEquality().hash(_subjects),
    const DeepCollectionEquality().hash(_bookshelves),
    const DeepCollectionEquality().hash(_languages),
    copyright,
    mediaType,
    const DeepCollectionEquality().hash(_formats),
    downloadCount,
  );

  /// Create a copy of BookEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookEntityImplCopyWith<_$BookEntityImpl> get copyWith =>
      __$$BookEntityImplCopyWithImpl<_$BookEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookEntityImplToJson(this);
  }
}

abstract class _BookEntity implements BookEntity {
  const factory _BookEntity({
    required final int id,
    required final String title,
    required final List<AuthorEntity> authors,
    required final List<String> summaries,
    required final List<AuthorEntity> translators,
    required final List<String> subjects,
    required final List<String> bookshelves,
    required final List<String> languages,
    required final bool copyright,
    required final String mediaType,
    required final Map<String, String> formats,
    required final int downloadCount,
  }) = _$BookEntityImpl;

  factory _BookEntity.fromJson(Map<String, dynamic> json) =
      _$BookEntityImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  List<AuthorEntity> get authors;
  @override
  List<String> get summaries;
  @override
  List<AuthorEntity> get translators;
  @override
  List<String> get subjects;
  @override
  List<String> get bookshelves;
  @override
  List<String> get languages;
  @override
  bool get copyright;
  @override
  String get mediaType;
  @override
  Map<String, String> get formats;
  @override
  int get downloadCount;

  /// Create a copy of BookEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookEntityImplCopyWith<_$BookEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
