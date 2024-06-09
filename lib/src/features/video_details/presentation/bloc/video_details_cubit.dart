import 'package:academy/src/core/data/local/shared_pref.dart';
import 'package:academy/src/di/di_setup.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'video_details_state.dart';

part 'video_details_cubit.freezed.dart';

@injectable
class VideoDetailsCubit extends Cubit<VideoDetailsState> {
  VideoDetailsCubit() : super(const VideoDetailsState.initial());

  static String url = '';

  void saveVideo(int? id) {
    if (id == null) return;
    getIt<Storage>().saveVideo(id);
  }
}
