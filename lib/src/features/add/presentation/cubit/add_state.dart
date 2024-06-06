part of 'add_cubit.dart';

@freezed
class AddState with _$AddState {
  const factory AddState.initial() = _Initial;
  const factory AddState.loading() = _Loading;
  const factory AddState.sucess() = _Success;
}
