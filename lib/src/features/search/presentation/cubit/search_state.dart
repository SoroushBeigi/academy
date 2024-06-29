import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../saved/domain/entity/content/response/content_response_entity.dart';
part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = _Initial;
  const factory SearchState.foundVideos(List<ContentResponseEntity> videos) = _Found;
  const factory SearchState.chipsChanged(Map<String,bool> chips) = _Chips;
}
