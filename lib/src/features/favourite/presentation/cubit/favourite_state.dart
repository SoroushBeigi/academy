import 'package:academy/content_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favourite_state.freezed.dart';

@freezed
class FavouriteState with _$FavouriteState {
  const factory FavouriteState.initial() = _Initial;
  const factory FavouriteState.updated(List<ContentEntity> videos) = _Updated;
}
