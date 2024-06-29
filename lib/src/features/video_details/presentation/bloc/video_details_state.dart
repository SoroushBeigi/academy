part of 'video_details_cubit.dart';


@freezed
class VideoDetailsState with _$VideoDetailsState {
  const factory VideoDetailsState.initial() = _Initial;
  const factory VideoDetailsState.loading() = _Loading;
  const factory VideoDetailsState.success() = _Success;
  const factory VideoDetailsState.error({required String errorMessage}) = _Error;
}