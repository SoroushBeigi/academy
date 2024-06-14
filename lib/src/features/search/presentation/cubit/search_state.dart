import 'package:academy/content_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = _Initial;
  const factory SearchState.foundVideos(List<ContentEntity> videos) = _Found;
  const factory SearchState.chipsChanged(Map<String,bool> chips) = _Chips;
}
