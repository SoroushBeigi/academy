// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ContentResponseEntity> videos) foundVideos,
    required TResult Function(Map<String, bool> chips) chipsChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ContentResponseEntity> videos)? foundVideos,
    TResult? Function(Map<String, bool> chips)? chipsChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ContentResponseEntity> videos)? foundVideos,
    TResult Function(Map<String, bool> chips)? chipsChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Found value) foundVideos,
    required TResult Function(_Chips value) chipsChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Found value)? foundVideos,
    TResult? Function(_Chips value)? chipsChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Found value)? foundVideos,
    TResult Function(_Chips value)? chipsChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res, SearchState>;
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res, $Val extends SearchState>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'SearchState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ContentResponseEntity> videos) foundVideos,
    required TResult Function(Map<String, bool> chips) chipsChanged,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ContentResponseEntity> videos)? foundVideos,
    TResult? Function(Map<String, bool> chips)? chipsChanged,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ContentResponseEntity> videos)? foundVideos,
    TResult Function(Map<String, bool> chips)? chipsChanged,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Found value) foundVideos,
    required TResult Function(_Chips value) chipsChanged,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Found value)? foundVideos,
    TResult? Function(_Chips value)? chipsChanged,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Found value)? foundVideos,
    TResult Function(_Chips value)? chipsChanged,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SearchState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'SearchState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ContentResponseEntity> videos) foundVideos,
    required TResult Function(Map<String, bool> chips) chipsChanged,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ContentResponseEntity> videos)? foundVideos,
    TResult? Function(Map<String, bool> chips)? chipsChanged,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ContentResponseEntity> videos)? foundVideos,
    TResult Function(Map<String, bool> chips)? chipsChanged,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Found value) foundVideos,
    required TResult Function(_Chips value) chipsChanged,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Found value)? foundVideos,
    TResult? Function(_Chips value)? chipsChanged,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Found value)? foundVideos,
    TResult Function(_Chips value)? chipsChanged,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements SearchState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$FoundImplCopyWith<$Res> {
  factory _$$FoundImplCopyWith(
          _$FoundImpl value, $Res Function(_$FoundImpl) then) =
      __$$FoundImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ContentResponseEntity> videos});
}

/// @nodoc
class __$$FoundImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$FoundImpl>
    implements _$$FoundImplCopyWith<$Res> {
  __$$FoundImplCopyWithImpl(
      _$FoundImpl _value, $Res Function(_$FoundImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videos = null,
  }) {
    return _then(_$FoundImpl(
      null == videos
          ? _value._videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<ContentResponseEntity>,
    ));
  }
}

/// @nodoc

class _$FoundImpl implements _Found {
  const _$FoundImpl(final List<ContentResponseEntity> videos)
      : _videos = videos;

  final List<ContentResponseEntity> _videos;
  @override
  List<ContentResponseEntity> get videos {
    if (_videos is EqualUnmodifiableListView) return _videos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_videos);
  }

  @override
  String toString() {
    return 'SearchState.foundVideos(videos: $videos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FoundImpl &&
            const DeepCollectionEquality().equals(other._videos, _videos));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_videos));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FoundImplCopyWith<_$FoundImpl> get copyWith =>
      __$$FoundImplCopyWithImpl<_$FoundImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ContentResponseEntity> videos) foundVideos,
    required TResult Function(Map<String, bool> chips) chipsChanged,
  }) {
    return foundVideos(videos);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ContentResponseEntity> videos)? foundVideos,
    TResult? Function(Map<String, bool> chips)? chipsChanged,
  }) {
    return foundVideos?.call(videos);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ContentResponseEntity> videos)? foundVideos,
    TResult Function(Map<String, bool> chips)? chipsChanged,
    required TResult orElse(),
  }) {
    if (foundVideos != null) {
      return foundVideos(videos);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Found value) foundVideos,
    required TResult Function(_Chips value) chipsChanged,
  }) {
    return foundVideos(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Found value)? foundVideos,
    TResult? Function(_Chips value)? chipsChanged,
  }) {
    return foundVideos?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Found value)? foundVideos,
    TResult Function(_Chips value)? chipsChanged,
    required TResult orElse(),
  }) {
    if (foundVideos != null) {
      return foundVideos(this);
    }
    return orElse();
  }
}

abstract class _Found implements SearchState {
  const factory _Found(final List<ContentResponseEntity> videos) = _$FoundImpl;

  List<ContentResponseEntity> get videos;
  @JsonKey(ignore: true)
  _$$FoundImplCopyWith<_$FoundImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChipsImplCopyWith<$Res> {
  factory _$$ChipsImplCopyWith(
          _$ChipsImpl value, $Res Function(_$ChipsImpl) then) =
      __$$ChipsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, bool> chips});
}

/// @nodoc
class __$$ChipsImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$ChipsImpl>
    implements _$$ChipsImplCopyWith<$Res> {
  __$$ChipsImplCopyWithImpl(
      _$ChipsImpl _value, $Res Function(_$ChipsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chips = null,
  }) {
    return _then(_$ChipsImpl(
      null == chips
          ? _value._chips
          : chips // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
    ));
  }
}

/// @nodoc

class _$ChipsImpl implements _Chips {
  const _$ChipsImpl(final Map<String, bool> chips) : _chips = chips;

  final Map<String, bool> _chips;
  @override
  Map<String, bool> get chips {
    if (_chips is EqualUnmodifiableMapView) return _chips;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_chips);
  }

  @override
  String toString() {
    return 'SearchState.chipsChanged(chips: $chips)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChipsImpl &&
            const DeepCollectionEquality().equals(other._chips, _chips));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_chips));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChipsImplCopyWith<_$ChipsImpl> get copyWith =>
      __$$ChipsImplCopyWithImpl<_$ChipsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ContentResponseEntity> videos) foundVideos,
    required TResult Function(Map<String, bool> chips) chipsChanged,
  }) {
    return chipsChanged(chips);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ContentResponseEntity> videos)? foundVideos,
    TResult? Function(Map<String, bool> chips)? chipsChanged,
  }) {
    return chipsChanged?.call(chips);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ContentResponseEntity> videos)? foundVideos,
    TResult Function(Map<String, bool> chips)? chipsChanged,
    required TResult orElse(),
  }) {
    if (chipsChanged != null) {
      return chipsChanged(chips);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Found value) foundVideos,
    required TResult Function(_Chips value) chipsChanged,
  }) {
    return chipsChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Found value)? foundVideos,
    TResult? Function(_Chips value)? chipsChanged,
  }) {
    return chipsChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Found value)? foundVideos,
    TResult Function(_Chips value)? chipsChanged,
    required TResult orElse(),
  }) {
    if (chipsChanged != null) {
      return chipsChanged(this);
    }
    return orElse();
  }
}

abstract class _Chips implements SearchState {
  const factory _Chips(final Map<String, bool> chips) = _$ChipsImpl;

  Map<String, bool> get chips;
  @JsonKey(ignore: true)
  _$$ChipsImplCopyWith<_$ChipsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
