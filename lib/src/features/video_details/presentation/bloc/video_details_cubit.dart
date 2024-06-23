import 'package:academy/content_entity.dart';
import 'package:academy/src/core/data/local/shared_pref.dart';
import 'package:academy/src/di/di_setup.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/resources/app_constants.dart';

part 'video_details_state.dart';

part 'video_details_cubit.freezed.dart';

@injectable
class VideoDetailsCubit extends Cubit<VideoDetailsState> {
  VideoDetailsCubit() : super(const VideoDetailsState.initial());

  static String url = '';

  final _dio = Dio(
    BaseOptions(
      baseUrl: AppConstants.baseUrl,
      headers: {'Content-Type': 'application/json'},
    ),
  );

  void saveVideo(int? id) {
    if (id == null) return;
    getIt<Storage>().saveVideo(id);
  }

  Future<void> like(bool isLiked, int contentId) async {
    final result = await _dio.post('/content/likes/$contentId', data: {
      'content_id': contentId,
      'liked': isLiked,
    });
    print(result.data);
  }



}
