import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_async_value.freezed.dart';

@freezed
class CustomAsyncValue<T> with _$CustomAsyncValue {
  const factory CustomAsyncValue.loading() = _Loading;
  const factory CustomAsyncValue.data(T data) = _Data;
  const factory CustomAsyncValue.success() = _Success;
  const factory CustomAsyncValue.error(Object error) = _Error;
}
