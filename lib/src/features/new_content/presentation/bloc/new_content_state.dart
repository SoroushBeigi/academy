

import 'package:freezed_annotation/freezed_annotation.dart';
part 'new_content_state.freezed.dart';

@freezed
class NewContentState with _$NewContentState {

  const factory NewContentState.idle() = NewContentStateIdle;

  const factory NewContentState.error({required String errorMessage}) =NewContentStateError;

  const factory NewContentState.success() = NewContentStateSuccess;

  const factory NewContentState.successAddNewContent() = NewContentStateSuccessAddNewContent;

  const factory NewContentState.loadingAddNewContent({required int progress}) = NewContentStateLoadingAddNewContent;

  const factory NewContentState.loading() = NewContentStateLoading;
}