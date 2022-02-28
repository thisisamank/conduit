// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'custom_async_value.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CustomAsyncValueTearOff {
  const _$CustomAsyncValueTearOff();

  _Loading<T> loading<T>() {
    return _Loading<T>();
  }

  _Data<T> data<T>(T data) {
    return _Data<T>(
      data,
    );
  }

  _Success<T> success<T>() {
    return _Success<T>();
  }

  _Error<T> error<T>(Object error) {
    return _Error<T>(
      error,
    );
  }
}

/// @nodoc
const $CustomAsyncValue = _$CustomAsyncValueTearOff();

/// @nodoc
mixin _$CustomAsyncValue<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(T data) data,
    required TResult Function() success,
    required TResult Function(Object error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T data)? data,
    TResult Function()? success,
    TResult Function(Object error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T data)? data,
    TResult Function()? success,
    TResult Function(Object error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading<T> value) loading,
    required TResult Function(_Data<T> value) data,
    required TResult Function(_Success<T> value) success,
    required TResult Function(_Error<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Data<T> value)? data,
    TResult Function(_Success<T> value)? success,
    TResult Function(_Error<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Data<T> value)? data,
    TResult Function(_Success<T> value)? success,
    TResult Function(_Error<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomAsyncValueCopyWith<T, $Res> {
  factory $CustomAsyncValueCopyWith(
          CustomAsyncValue<T> value, $Res Function(CustomAsyncValue<T>) then) =
      _$CustomAsyncValueCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$CustomAsyncValueCopyWithImpl<T, $Res>
    implements $CustomAsyncValueCopyWith<T, $Res> {
  _$CustomAsyncValueCopyWithImpl(this._value, this._then);

  final CustomAsyncValue<T> _value;
  // ignore: unused_field
  final $Res Function(CustomAsyncValue<T>) _then;
}

/// @nodoc
abstract class _$LoadingCopyWith<T, $Res> {
  factory _$LoadingCopyWith(
          _Loading<T> value, $Res Function(_Loading<T>) then) =
      __$LoadingCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<T, $Res>
    extends _$CustomAsyncValueCopyWithImpl<T, $Res>
    implements _$LoadingCopyWith<T, $Res> {
  __$LoadingCopyWithImpl(_Loading<T> _value, $Res Function(_Loading<T>) _then)
      : super(_value, (v) => _then(v as _Loading<T>));

  @override
  _Loading<T> get _value => super._value as _Loading<T>;
}

/// @nodoc

class _$_Loading<T> implements _Loading<T> {
  const _$_Loading();

  @override
  String toString() {
    return 'CustomAsyncValue<$T>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Loading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(T data) data,
    required TResult Function() success,
    required TResult Function(Object error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T data)? data,
    TResult Function()? success,
    TResult Function(Object error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T data)? data,
    TResult Function()? success,
    TResult Function(Object error)? error,
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
    required TResult Function(_Loading<T> value) loading,
    required TResult Function(_Data<T> value) data,
    required TResult Function(_Success<T> value) success,
    required TResult Function(_Error<T> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Data<T> value)? data,
    TResult Function(_Success<T> value)? success,
    TResult Function(_Error<T> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Data<T> value)? data,
    TResult Function(_Success<T> value)? success,
    TResult Function(_Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading<T> implements CustomAsyncValue<T> {
  const factory _Loading() = _$_Loading<T>;
}

/// @nodoc
abstract class _$DataCopyWith<T, $Res> {
  factory _$DataCopyWith(_Data<T> value, $Res Function(_Data<T>) then) =
      __$DataCopyWithImpl<T, $Res>;
  $Res call({T data});
}

/// @nodoc
class __$DataCopyWithImpl<T, $Res>
    extends _$CustomAsyncValueCopyWithImpl<T, $Res>
    implements _$DataCopyWith<T, $Res> {
  __$DataCopyWithImpl(_Data<T> _value, $Res Function(_Data<T>) _then)
      : super(_value, (v) => _then(v as _Data<T>));

  @override
  _Data<T> get _value => super._value as _Data<T>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_Data<T>(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$_Data<T> implements _Data<T> {
  const _$_Data(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'CustomAsyncValue<$T>.data(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Data<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$DataCopyWith<T, _Data<T>> get copyWith =>
      __$DataCopyWithImpl<T, _Data<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(T data) data,
    required TResult Function() success,
    required TResult Function(Object error) error,
  }) {
    return data(this.data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T data)? data,
    TResult Function()? success,
    TResult Function(Object error)? error,
  }) {
    return data?.call(this.data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T data)? data,
    TResult Function()? success,
    TResult Function(Object error)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this.data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading<T> value) loading,
    required TResult Function(_Data<T> value) data,
    required TResult Function(_Success<T> value) success,
    required TResult Function(_Error<T> value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Data<T> value)? data,
    TResult Function(_Success<T> value)? success,
    TResult Function(_Error<T> value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Data<T> value)? data,
    TResult Function(_Success<T> value)? success,
    TResult Function(_Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class _Data<T> implements CustomAsyncValue<T> {
  const factory _Data(T data) = _$_Data<T>;

  T get data;
  @JsonKey(ignore: true)
  _$DataCopyWith<T, _Data<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SuccessCopyWith<T, $Res> {
  factory _$SuccessCopyWith(
          _Success<T> value, $Res Function(_Success<T>) then) =
      __$SuccessCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$SuccessCopyWithImpl<T, $Res>
    extends _$CustomAsyncValueCopyWithImpl<T, $Res>
    implements _$SuccessCopyWith<T, $Res> {
  __$SuccessCopyWithImpl(_Success<T> _value, $Res Function(_Success<T>) _then)
      : super(_value, (v) => _then(v as _Success<T>));

  @override
  _Success<T> get _value => super._value as _Success<T>;
}

/// @nodoc

class _$_Success<T> implements _Success<T> {
  const _$_Success();

  @override
  String toString() {
    return 'CustomAsyncValue<$T>.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Success<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(T data) data,
    required TResult Function() success,
    required TResult Function(Object error) error,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T data)? data,
    TResult Function()? success,
    TResult Function(Object error)? error,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T data)? data,
    TResult Function()? success,
    TResult Function(Object error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading<T> value) loading,
    required TResult Function(_Data<T> value) data,
    required TResult Function(_Success<T> value) success,
    required TResult Function(_Error<T> value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Data<T> value)? data,
    TResult Function(_Success<T> value)? success,
    TResult Function(_Error<T> value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Data<T> value)? data,
    TResult Function(_Success<T> value)? success,
    TResult Function(_Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success<T> implements CustomAsyncValue<T> {
  const factory _Success() = _$_Success<T>;
}

/// @nodoc
abstract class _$ErrorCopyWith<T, $Res> {
  factory _$ErrorCopyWith(_Error<T> value, $Res Function(_Error<T>) then) =
      __$ErrorCopyWithImpl<T, $Res>;
  $Res call({Object error});
}

/// @nodoc
class __$ErrorCopyWithImpl<T, $Res>
    extends _$CustomAsyncValueCopyWithImpl<T, $Res>
    implements _$ErrorCopyWith<T, $Res> {
  __$ErrorCopyWithImpl(_Error<T> _value, $Res Function(_Error<T>) _then)
      : super(_value, (v) => _then(v as _Error<T>));

  @override
  _Error<T> get _value => super._value as _Error<T>;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_Error<T>(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Object,
    ));
  }
}

/// @nodoc

class _$_Error<T> implements _Error<T> {
  const _$_Error(this.error);

  @override
  final Object error;

  @override
  String toString() {
    return 'CustomAsyncValue<$T>.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error<T> &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$ErrorCopyWith<T, _Error<T>> get copyWith =>
      __$ErrorCopyWithImpl<T, _Error<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(T data) data,
    required TResult Function() success,
    required TResult Function(Object error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T data)? data,
    TResult Function()? success,
    TResult Function(Object error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T data)? data,
    TResult Function()? success,
    TResult Function(Object error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading<T> value) loading,
    required TResult Function(_Data<T> value) data,
    required TResult Function(_Success<T> value) success,
    required TResult Function(_Error<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Data<T> value)? data,
    TResult Function(_Success<T> value)? success,
    TResult Function(_Error<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Data<T> value)? data,
    TResult Function(_Success<T> value)? success,
    TResult Function(_Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error<T> implements CustomAsyncValue<T> {
  const factory _Error(Object error) = _$_Error<T>;

  Object get error;
  @JsonKey(ignore: true)
  _$ErrorCopyWith<T, _Error<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
