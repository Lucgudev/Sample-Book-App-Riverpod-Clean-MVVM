// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$HomeViewState {
  List<BookEntity> get books => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isLoadingMore => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  String? get searchQuery => throw _privateConstructorUsedError;

  /// Create a copy of HomeViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeViewStateCopyWith<HomeViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeViewStateCopyWith<$Res> {
  factory $HomeViewStateCopyWith(
    HomeViewState value,
    $Res Function(HomeViewState) then,
  ) = _$HomeViewStateCopyWithImpl<$Res, HomeViewState>;
  @useResult
  $Res call({
    List<BookEntity> books,
    bool isLoading,
    bool isLoadingMore,
    int currentPage,
    bool hasMore,
    String? error,
    String? searchQuery,
  });
}

/// @nodoc
class _$HomeViewStateCopyWithImpl<$Res, $Val extends HomeViewState>
    implements $HomeViewStateCopyWith<$Res> {
  _$HomeViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeViewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? books = null,
    Object? isLoading = null,
    Object? isLoadingMore = null,
    Object? currentPage = null,
    Object? hasMore = null,
    Object? error = freezed,
    Object? searchQuery = freezed,
  }) {
    return _then(
      _value.copyWith(
            books:
                null == books
                    ? _value.books
                    : books // ignore: cast_nullable_to_non_nullable
                        as List<BookEntity>,
            isLoading:
                null == isLoading
                    ? _value.isLoading
                    : isLoading // ignore: cast_nullable_to_non_nullable
                        as bool,
            isLoadingMore:
                null == isLoadingMore
                    ? _value.isLoadingMore
                    : isLoadingMore // ignore: cast_nullable_to_non_nullable
                        as bool,
            currentPage:
                null == currentPage
                    ? _value.currentPage
                    : currentPage // ignore: cast_nullable_to_non_nullable
                        as int,
            hasMore:
                null == hasMore
                    ? _value.hasMore
                    : hasMore // ignore: cast_nullable_to_non_nullable
                        as bool,
            error:
                freezed == error
                    ? _value.error
                    : error // ignore: cast_nullable_to_non_nullable
                        as String?,
            searchQuery:
                freezed == searchQuery
                    ? _value.searchQuery
                    : searchQuery // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HomeViewStateImplCopyWith<$Res>
    implements $HomeViewStateCopyWith<$Res> {
  factory _$$HomeViewStateImplCopyWith(
    _$HomeViewStateImpl value,
    $Res Function(_$HomeViewStateImpl) then,
  ) = __$$HomeViewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<BookEntity> books,
    bool isLoading,
    bool isLoadingMore,
    int currentPage,
    bool hasMore,
    String? error,
    String? searchQuery,
  });
}

/// @nodoc
class __$$HomeViewStateImplCopyWithImpl<$Res>
    extends _$HomeViewStateCopyWithImpl<$Res, _$HomeViewStateImpl>
    implements _$$HomeViewStateImplCopyWith<$Res> {
  __$$HomeViewStateImplCopyWithImpl(
    _$HomeViewStateImpl _value,
    $Res Function(_$HomeViewStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeViewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? books = null,
    Object? isLoading = null,
    Object? isLoadingMore = null,
    Object? currentPage = null,
    Object? hasMore = null,
    Object? error = freezed,
    Object? searchQuery = freezed,
  }) {
    return _then(
      _$HomeViewStateImpl(
        books:
            null == books
                ? _value._books
                : books // ignore: cast_nullable_to_non_nullable
                    as List<BookEntity>,
        isLoading:
            null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                    as bool,
        isLoadingMore:
            null == isLoadingMore
                ? _value.isLoadingMore
                : isLoadingMore // ignore: cast_nullable_to_non_nullable
                    as bool,
        currentPage:
            null == currentPage
                ? _value.currentPage
                : currentPage // ignore: cast_nullable_to_non_nullable
                    as int,
        hasMore:
            null == hasMore
                ? _value.hasMore
                : hasMore // ignore: cast_nullable_to_non_nullable
                    as bool,
        error:
            freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                    as String?,
        searchQuery:
            freezed == searchQuery
                ? _value.searchQuery
                : searchQuery // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

class _$HomeViewStateImpl implements _HomeViewState {
  const _$HomeViewStateImpl({
    final List<BookEntity> books = const [],
    this.isLoading = false,
    this.isLoadingMore = false,
    this.currentPage = 1,
    this.hasMore = false,
    this.error,
    this.searchQuery,
  }) : _books = books;

  final List<BookEntity> _books;
  @override
  @JsonKey()
  List<BookEntity> get books {
    if (_books is EqualUnmodifiableListView) return _books;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_books);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isLoadingMore;
  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final bool hasMore;
  @override
  final String? error;
  @override
  final String? searchQuery;

  @override
  String toString() {
    return 'HomeViewState(books: $books, isLoading: $isLoading, isLoadingMore: $isLoadingMore, currentPage: $currentPage, hasMore: $hasMore, error: $error, searchQuery: $searchQuery)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeViewStateImpl &&
            const DeepCollectionEquality().equals(other._books, _books) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_books),
    isLoading,
    isLoadingMore,
    currentPage,
    hasMore,
    error,
    searchQuery,
  );

  /// Create a copy of HomeViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeViewStateImplCopyWith<_$HomeViewStateImpl> get copyWith =>
      __$$HomeViewStateImplCopyWithImpl<_$HomeViewStateImpl>(this, _$identity);
}

abstract class _HomeViewState implements HomeViewState {
  const factory _HomeViewState({
    final List<BookEntity> books,
    final bool isLoading,
    final bool isLoadingMore,
    final int currentPage,
    final bool hasMore,
    final String? error,
    final String? searchQuery,
  }) = _$HomeViewStateImpl;

  @override
  List<BookEntity> get books;
  @override
  bool get isLoading;
  @override
  bool get isLoadingMore;
  @override
  int get currentPage;
  @override
  bool get hasMore;
  @override
  String? get error;
  @override
  String? get searchQuery;

  /// Create a copy of HomeViewState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeViewStateImplCopyWith<_$HomeViewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
