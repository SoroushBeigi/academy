part of 'add_cubit.dart';

@freezed
class AddState with _$AddState {
  const factory AddState.initial() = _Initial;
  const factory AddState.loading(double progress) = _Loading;
  const factory AddState.success() = _Success;
  const factory AddState.error({required String errorMessage}) = _Error;
}
