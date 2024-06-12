import 'package:academy/video_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = _Initial;
  const factory SearchState.foundVideos(List<VideoModel> videos) = _Found;
  const factory SearchState.chipsChanged(Map<String,bool> chips) = _Chips;
}
