import 'package:freezed_annotation/freezed_annotation.dart';
part 'favourite_state.freezed.dart';

@freezed
class FavouriteState with _$FavouriteState {
  const factory FavouriteState.initial() = _Initial;
  const factory FavouriteState.loading() = _Loading;
  const factory FavouriteState.success() = _Success;
  const factory FavouriteState.error({required String errorMessage}) = _Error;
}
