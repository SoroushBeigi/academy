// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ApiResult<T> {
  Object? get failures => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data, List<String>? failures, int? resultCode)
        success,
    required TResult Function(T data, List<String>? failures, int? resultCode)
        successWithPages,
    required TResult Function(NetworkExceptions error, String? failures)
        failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data, List<String>? failures, int? resultCode)? success,
    TResult? Function(T data, List<String>? failures, int? resultCode)?
        successWithPages,
    TResult? Function(NetworkExceptions error, String? failures)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data, List<String>? failures, int? resultCode)? success,
    TResult Function(T data, List<String>? failures, int? resultCode)?
        successWithPages,
    TResult Function(NetworkExceptions error, String? failures)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<T> value) success,
    required TResult Function(SuccessWithPages<T> value) successWithPages,
    required TResult Function(Failure<T> value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success<T> value)? success,
    TResult? Function(SuccessWithPages<T> value)? successWithPages,
    TResult? Function(Failure<T> value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<T> value)? success,
    TResult Function(SuccessWithPages<T> value)? successWithPages,
    TResult Function(Failure<T> value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResultCopyWith<T, $Res> {
  factory $ApiResultCopyWith(
          ApiResult<T> value, $Res Function(ApiResult<T>) then) =
      _$ApiResultCopyWithImpl<T, $Res, ApiResult<T>>;
}

/// @nodoc
class _$ApiResultCopyWithImpl<T, $Res, $Val extends ApiResult<T>>
    implements $ApiResultCopyWith<T, $Res> {
  _$ApiResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<T, $Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl<T> value, $Res Function(_$SuccessImpl<T>) then) =
      __$$SuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data, List<String>? failures, int? resultCode});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<T, $Res>
    extends _$ApiResultCopyWithImpl<T, $Res, _$SuccessImpl<T>>
    implements _$$SuccessImplCopyWith<T, $Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl<T> _value, $Res Function(_$SuccessImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? failures = freezed,
    Object? resultCode = freezed,
  }) {
    return _then(_$SuccessImpl<T>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
      failures: freezed == failures
          ? _value._failures
          : failures // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      resultCode: freezed == resultCode
          ? _value.resultCode
          : resultCode // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$SuccessImpl<T> implements Success<T> {
  const _$SuccessImpl(
      {required this.data, final List<String>? failures, this.resultCode})
      : _failures = failures;

  @override
  final T data;
  final List<String>? _failures;
  @override
  List<String>? get failures {
    final value = _failures;
    if (value == null) return null;
    if (_failures is EqualUnmodifiableListView) return _failures;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? resultCode;

  @override
  String toString() {
    return 'ApiResult<$T>.success(data: $data, failures: $failures, resultCode: $resultCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality().equals(other._failures, _failures) &&
            (identical(other.resultCode, resultCode) ||
                other.resultCode == resultCode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(data),
      const DeepCollectionEquality().hash(_failures),
      resultCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<T, _$SuccessImpl<T>> get copyWith =>
      __$$SuccessImplCopyWithImpl<T, _$SuccessImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data, List<String>? failures, int? resultCode)
        success,
    required TResult Function(T data, List<String>? failures, int? resultCode)
        successWithPages,
    required TResult Function(NetworkExceptions error, String? failures)
        failure,
  }) {
    return success(data, failures, resultCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data, List<String>? failures, int? resultCode)? success,
    TResult? Function(T data, List<String>? failures, int? resultCode)?
        successWithPages,
    TResult? Function(NetworkExceptions error, String? failures)? failure,
  }) {
    return success?.call(data, failures, resultCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data, List<String>? failures, int? resultCode)? success,
    TResult Function(T data, List<String>? failures, int? resultCode)?
        successWithPages,
    TResult Function(NetworkExceptions error, String? failures)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data, failures, resultCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<T> value) success,
    required TResult Function(SuccessWithPages<T> value) successWithPages,
    required TResult Function(Failure<T> value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success<T> value)? success,
    TResult? Function(SuccessWithPages<T> value)? successWithPages,
    TResult? Function(Failure<T> value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<T> value)? success,
    TResult Function(SuccessWithPages<T> value)? successWithPages,
    TResult Function(Failure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success<T> implements ApiResult<T> {
  const factory Success(
      {required final T data,
      final List<String>? failures,
      final int? resultCode}) = _$SuccessImpl<T>;

  T get data;
  @override
  List<String>? get failures;
  int? get resultCode;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<T, _$SuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessWithPagesImplCopyWith<T, $Res> {
  factory _$$SuccessWithPagesImplCopyWith(_$SuccessWithPagesImpl<T> value,
          $Res Function(_$SuccessWithPagesImpl<T>) then) =
      __$$SuccessWithPagesImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data, List<String>? failures, int? resultCode});
}

/// @nodoc
class __$$SuccessWithPagesImplCopyWithImpl<T, $Res>
    extends _$ApiResultCopyWithImpl<T, $Res, _$SuccessWithPagesImpl<T>>
    implements _$$SuccessWithPagesImplCopyWith<T, $Res> {
  __$$SuccessWithPagesImplCopyWithImpl(_$SuccessWithPagesImpl<T> _value,
      $Res Function(_$SuccessWithPagesImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? failures = freezed,
    Object? resultCode = freezed,
  }) {
    return _then(_$SuccessWithPagesImpl<T>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
      failures: freezed == failures
          ? _value._failures
          : failures // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      resultCode: freezed == resultCode
          ? _value.resultCode
          : resultCode // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$SuccessWithPagesImpl<T> implements SuccessWithPages<T> {
  const _$SuccessWithPagesImpl(
      {required this.data, final List<String>? failures, this.resultCode})
      : _failures = failures;

  @override
  final T data;
  final List<String>? _failures;
  @override
  List<String>? get failures {
    final value = _failures;
    if (value == null) return null;
    if (_failures is EqualUnmodifiableListView) return _failures;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? resultCode;

  @override
  String toString() {
    return 'ApiResult<$T>.successWithPages(data: $data, failures: $failures, resultCode: $resultCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessWithPagesImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality().equals(other._failures, _failures) &&
            (identical(other.resultCode, resultCode) ||
                other.resultCode == resultCode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(data),
      const DeepCollectionEquality().hash(_failures),
      resultCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessWithPagesImplCopyWith<T, _$SuccessWithPagesImpl<T>> get copyWith =>
      __$$SuccessWithPagesImplCopyWithImpl<T, _$SuccessWithPagesImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data, List<String>? failures, int? resultCode)
        success,
    required TResult Function(T data, List<String>? failures, int? resultCode)
        successWithPages,
    required TResult Function(NetworkExceptions error, String? failures)
        failure,
  }) {
    return successWithPages(data, failures, resultCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data, List<String>? failures, int? resultCode)? success,
    TResult? Function(T data, List<String>? failures, int? resultCode)?
        successWithPages,
    TResult? Function(NetworkExceptions error, String? failures)? failure,
  }) {
    return successWithPages?.call(data, failures, resultCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data, List<String>? failures, int? resultCode)? success,
    TResult Function(T data, List<String>? failures, int? resultCode)?
        successWithPages,
    TResult Function(NetworkExceptions error, String? failures)? failure,
    required TResult orElse(),
  }) {
    if (successWithPages != null) {
      return successWithPages(data, failures, resultCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<T> value) success,
    required TResult Function(SuccessWithPages<T> value) successWithPages,
    required TResult Function(Failure<T> value) failure,
  }) {
    return successWithPages(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success<T> value)? success,
    TResult? Function(SuccessWithPages<T> value)? successWithPages,
    TResult? Function(Failure<T> value)? failure,
  }) {
    return successWithPages?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<T> value)? success,
    TResult Function(SuccessWithPages<T> value)? successWithPages,
    TResult Function(Failure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (successWithPages != null) {
      return successWithPages(this);
    }
    return orElse();
  }
}

abstract class SuccessWithPages<T> implements ApiResult<T> {
  const factory SuccessWithPages(
      {required final T data,
      final List<String>? failures,
      final int? resultCode}) = _$SuccessWithPagesImpl<T>;

  T get data;
  @override
  List<String>? get failures;
  int? get resultCode;
  @JsonKey(ignore: true)
  _$$SuccessWithPagesImplCopyWith<T, _$SuccessWithPagesImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<T, $Res> {
  factory _$$FailureImplCopyWith(
          _$FailureImpl<T> value, $Res Function(_$FailureImpl<T>) then) =
      __$$FailureImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({NetworkExceptions error, String? failures});

  $NetworkExceptionsCopyWith<$Res> get error;
}

/// @nodoc
class __$$FailureImplCopyWithImpl<T, $Res>
    extends _$ApiResultCopyWithImpl<T, $Res, _$FailureImpl<T>>
    implements _$$FailureImplCopyWith<T, $Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl<T> _value, $Res Function(_$FailureImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? failures = freezed,
  }) {
    return _then(_$FailureImpl<T>(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as NetworkExceptions,
      failures: freezed == failures
          ? _value.failures
          : failures // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $NetworkExceptionsCopyWith<$Res> get error {
    return $NetworkExceptionsCopyWith<$Res>(_value.error, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

/// @nodoc

class _$FailureImpl<T> implements Failure<T> {
  const _$FailureImpl({required this.error, this.failures});

  @override
  final NetworkExceptions error;
  @override
  final String? failures;

  @override
  String toString() {
    return 'ApiResult<$T>.failure(error: $error, failures: $failures)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl<T> &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.failures, failures) ||
                other.failures == failures));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error, failures);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<T, _$FailureImpl<T>> get copyWith =>
      __$$FailureImplCopyWithImpl<T, _$FailureImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data, List<String>? failures, int? resultCode)
        success,
    required TResult Function(T data, List<String>? failures, int? resultCode)
        successWithPages,
    required TResult Function(NetworkExceptions error, String? failures)
        failure,
  }) {
    return failure(error, failures);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data, List<String>? failures, int? resultCode)? success,
    TResult? Function(T data, List<String>? failures, int? resultCode)?
        successWithPages,
    TResult? Function(NetworkExceptions error, String? failures)? failure,
  }) {
    return failure?.call(error, failures);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data, List<String>? failures, int? resultCode)? success,
    TResult Function(T data, List<String>? failures, int? resultCode)?
        successWithPages,
    TResult Function(NetworkExceptions error, String? failures)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(error, failures);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<T> value) success,
    required TResult Function(SuccessWithPages<T> value) successWithPages,
    required TResult Function(Failure<T> value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success<T> value)? success,
    TResult? Function(SuccessWithPages<T> value)? successWithPages,
    TResult? Function(Failure<T> value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<T> value)? success,
    TResult Function(SuccessWithPages<T> value)? successWithPages,
    TResult Function(Failure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class Failure<T> implements ApiResult<T> {
  const factory Failure(
      {required final NetworkExceptions error,
      final String? failures}) = _$FailureImpl<T>;

  NetworkExceptions get error;
  @override
  String? get failures;
  @JsonKey(ignore: true)
  _$$FailureImplCopyWith<T, _$FailureImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
