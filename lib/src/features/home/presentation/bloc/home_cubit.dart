import 'package:academy/src/core/resources/app_constants.dart';
import 'package:academy/video_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'home_state.dart';


@singleton
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState.loading());
  final _dio = Dio(
    BaseOptions(
      baseUrl: AppConstants.baseUrl,
      headers: {'Content-Type': 'application/json'},
    ),
  );
  static List<VideoModel> videos = [];

  Future<void> getVideos() async{
    emit(const HomeState.loading());
    try{
      final result = await _dio.get('/content');
      final fetchedVideos = (result.data as List).map((json) => VideoModel.fromJson(json)).toList();
      videos.addAll(fetchedVideos);
      videos = videos.reversed.toList();

      emit(const HomeState.done());
    }on DioException catch(e){
      debugPrint(e.error.toString());
    }
  }
}

