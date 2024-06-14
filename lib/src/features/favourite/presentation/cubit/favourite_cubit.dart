import 'package:academy/src/core/data/local/shared_pref.dart';
import 'package:academy/src/di/di_setup.dart';
import 'package:academy/src/features/favourite/presentation/cubit/favourite_state.dart';
import 'package:academy/src/features/home/presentation/bloc/home_cubit.dart';
import 'package:academy/content_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(const FavouriteState.initial());
  final _storage = getIt<Storage>();

  //returns videoModel with id == -1 if could not find the proper model
  ContentEntity getSavedVideos(int index) {
    final id = _storage.getSavedVideos()[index];
    final videoModel = HomeCubit.videos.firstWhere(
      (element) => element.id.toString() == id,
      orElse: () => ContentEntity(id: -1),
    );

    return videoModel;
  }

  int savedListLength() {
    return _storage.getSavedVideos().length;
  }
}
