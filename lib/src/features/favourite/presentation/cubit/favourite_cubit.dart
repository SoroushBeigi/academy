import 'package:academy/src/core/data/local/shared_pref.dart';
import 'package:academy/src/di/di_setup.dart';
import 'package:academy/src/features/favourite/presentation/cubit/favourite_state.dart';
import 'package:academy/src/features/features.dart';
import 'package:academy/video_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(const FavouriteState.initial());
  final _storage = getIt<Storage>();

  //returns videoModel with id == -1 if could not find the proper model
  VideoModel getSavedVideos(int index) {
    final id = _storage.getSavedVideos()[index];
    final videoModel = HomeCubit.videos.firstWhere(
      (element) => element.id.toString() == id,
      orElse: () => VideoModel(id: -1),
    );

    return videoModel;
  }

  int savedListLength() {
    print(_storage.getSavedVideos().length);
    return _storage.getSavedVideos().length;
  }
}
