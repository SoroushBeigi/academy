import 'package:academy/src/core/resources/app_constants.dart';
import 'package:academy/src/core/resources/resources.dart';
import 'package:academy/src/features/favourite/domain/entity/category/response/category_response_entity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../favourite/domain/entity/content/response/content_response_entity.dart';
import 'home_state.dart';

@singleton
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState.initial());
  final _dio = Dio(
    BaseOptions(
      baseUrl: AppConstants.baseUrl,
      headers: {'Content-Type': 'application/json'},
    ),
  );
  static List<ContentResponseEntity> videos = [];
  static Map<String, bool> chips = {};
  static List<CategoryResponseEntity> categories = [];

  Future<void> initial() async {
    emit(const HomeState.loading());
    await getVideos();
    await getCategories();

    emit(const HomeState.done());
  }

  Future<void> getVideos() async {
    try {
      final result = await _dio.get('/content');
      final fetchedVideos = (result.data as List)
          .map((json) => ContentResponseEntity.fromJson(json))
          .toList()
          .where(
            (element) => AppConstants.showApprovedOnly
                ? (element.isApproved ?? false)
                : true,
          );
      videos.clear();
      if (kIsWeb) {
        final List<ContentResponseEntity> tvs = AppConstants.tvs
            .map(
              (tv) => ContentResponseEntity(
                  url: AppConstants.webTVUrl +
                      (tv.url ?? '/hls/tv1/tv1_540/index.m3u8'),
                  description: tv.description,
                  title: tv.name,isLive: true,
              imageUrl: tv.imageUrl,),
            )
            .toList();
        videos.addAll(tvs);
      } else {
        final List<ContentResponseEntity> tvs = AppConstants.tvs
            .map(
              (tv) => ContentResponseEntity(
                isLive: true,
                  url: AppConstants.mobileTVUrl +
                      (tv.url ?? '/hls/tv1/tv1_540/index.m3u8'),
                  description: tv.description,
                  title: tv.name,
                  imageUrl: tv.imageUrl,),
            )
            .toList();
        videos.addAll(tvs);
      }

      videos.addAll(fetchedVideos);
      videos = videos.reversed.toList();

      // return;
    } on DioException catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> getCategories() async {
    try {
      final result = await _dio.get('/categories');
      final fetchedCategories = (result.data as List)
          .map((json) => CategoryResponseEntity.fromJson(json))
          .toList();
      categories.clear();
      categories.addAll(fetchedCategories);
      chips.addAll({AppConstants.allVideosChip: false, AppConstants.tvChip: false});
      chips.addAll(
          {for (var category in categories) category.name ?? '': false});

      // return;
    } on DioException catch (e) {
      debugPrint(e.error.toString());
    }
  }
}
