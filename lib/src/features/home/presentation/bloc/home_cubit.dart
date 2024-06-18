import 'package:academy/src/core/resources/app_constants.dart';
import 'package:academy/content_entity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

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
  static List<ContentEntity> videos = [];

  static List<Category> categories = [];

  Future<void> initial () async {
    emit(const HomeState.loading());
    await getVideos();

    await getCategories();

    emit(const HomeState.done());

  }


  Future<void> getVideos() async{
    try{
      final result = await _dio.get('/content');
      final fetchedVideos = (result.data as List).map((json) => ContentEntity.fromJson(json)).toList();
      videos.clear();
      videos.addAll(fetchedVideos);
      videos = videos.reversed.toList();

      // return;
    }on DioException catch(e){
      debugPrint(e.error.toString());
    }
  }


  Future<void> getCategories() async{
    try{
      final result = await _dio.get('/categories');
      print(result.toString());

      final fetchedCategories = (result.data as List).map((json) => Category.fromJson(json)).toList();
      categories.clear();
      categories.addAll(fetchedCategories);
      categories = categories.reversed.toList();

      _dio.close();
      // return;


    }on DioException catch(e){
      debugPrint(e.error.toString());
    }
  }


}

