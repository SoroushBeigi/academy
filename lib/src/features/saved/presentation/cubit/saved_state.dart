import 'package:freezed_annotation/freezed_annotation.dart';
part 'saved_state.freezed.dart';

@freezed
class SavedState with _$SavedState {
  const factory SavedState.initial() = _Initial;
  const factory SavedState.loading() = _Loading;
  const factory SavedState.success() = _Success;
  const factory SavedState.error({required String errorMessage}) = _Error;
}
