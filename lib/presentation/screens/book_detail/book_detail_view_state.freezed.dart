// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_detail_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$BookDetailViewState {
  BookEntity? get book => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of BookDetailViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookDetailViewStateCopyWith<BookDetailViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookDetailViewStateCopyWith<$Res> {
  factory $BookDetailViewStateCopyWith(
    BookDetailViewState value,
    $Res Function(BookDetailViewState) then,
  ) = _$BookDetailViewStateCopyWithImpl<$Res, BookDetailViewState>;
  @useResult
  $Res call({BookEntity? book, bool isLoading, String? error});

  $BookEntityCopyWith<$Res>? get book;
}

/// @nodoc
class _$BookDetailViewStateCopyWithImpl<$Res, $Val extends BookDetailViewState>
    implements $BookDetailViewStateCopyWith<$Res> {
  _$BookDetailViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookDetailViewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? book = freezed,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(
      _value.copyWith(
            book:
                freezed == book
                    ? _value.book
                    : book // ignore: cast_nullable_to_non_nullable
                        as BookEntity?,
            isLoading:
                null == isLoading
                    ? _value.isLoading
                    : isLoading // ignore: cast_nullable_to_non_nullable
                        as bool,
            error:
                freezed == error
                    ? _value.error
                    : error // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of BookDetailViewState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BookEntityCopyWith<$Res>? get book {
    if (_value.book == null) {
      return null;
    }

    return $BookEntityCopyWith<$Res>(_value.book!, (value) {
      return _then(_value.copyWith(book: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BookDetailViewStateImplCopyWith<$Res>
    implements $BookDetailViewStateCopyWith<$Res> {
  factory _$$BookDetailViewStateImplCopyWith(
    _$BookDetailViewStateImpl value,
    $Res Function(_$BookDetailViewStateImpl) then,
  ) = __$$BookDetailViewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BookEntity? book, bool isLoading, String? error});

  @override
  $BookEntityCopyWith<$Res>? get book;
}

/// @nodoc
class __$$BookDetailViewStateImplCopyWithImpl<$Res>
    extends _$BookDetailViewStateCopyWithImpl<$Res, _$BookDetailViewStateImpl>
    implements _$$BookDetailViewStateImplCopyWith<$Res> {
  __$$BookDetailViewStateImplCopyWithImpl(
    _$BookDetailViewStateImpl _value,
    $Res Function(_$BookDetailViewStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BookDetailViewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? book = freezed,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(
      _$BookDetailViewStateImpl(
        book:
            freezed == book
                ? _value.book
                : book // ignore: cast_nullable_to_non_nullable
                    as BookEntity?,
        isLoading:
            null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                    as bool,
        error:
            freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

class _$BookDetailViewStateImpl implements _BookDetailViewState {
  const _$BookDetailViewStateImpl({
    this.book,
    this.isLoading = false,
    this.error,
  });

  @override
  final BookEntity? book;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;

  @override
  String toString() {
    return 'BookDetailViewState(book: $book, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookDetailViewStateImpl &&
            (identical(other.book, book) || other.book == book) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, book, isLoading, error);

  /// Create a copy of BookDetailViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookDetailViewStateImplCopyWith<_$BookDetailViewStateImpl> get copyWith =>
      __$$BookDetailViewStateImplCopyWithImpl<_$BookDetailViewStateImpl>(
        this,
        _$identity,
      );
}

abstract class _BookDetailViewState implements BookDetailViewState {
  const factory _BookDetailViewState({
    final BookEntity? book,
    final bool isLoading,
    final String? error,
  }) = _$BookDetailViewStateImpl;

  @override
  BookEntity? get book;
  @override
  bool get isLoading;
  @override
  String? get error;

  /// Create a copy of BookDetailViewState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookDetailViewStateImplCopyWith<_$BookDetailViewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
