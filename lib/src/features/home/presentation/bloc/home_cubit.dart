import 'package:academy/src/core/resources/app_constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState.initial());
  final _dio = Dio(
    BaseOptions(
      baseUrl: AppConstants.baseUrl,
      headers: {'Content-Type': 'application/json'},
    ),
  );
  List<VideoModel> videos = [];

  Future<void> getVideos() async{
    try{
      final result = await _dio.get('/content');
      final fetchedVideos = (result.data as List).map((json) => VideoModel.fromJson(json)).toList();
      videos.addAll(fetchedVideos);
    }on DioException catch(e){
      print(e.error);
    }
  }
}

class VideoModel {
  int? id;
  int? categoryId;
  int? authorId;
  String? title;
  String? description;
  String? authorName;
  String? url;
  String? imageUrl;

  VideoModel({
    this.id,
    this.categoryId,
    this.authorId,
    this.title,
    this.description,
    this.authorName,
    this.url,
    this.imageUrl,
  });

  VideoModel.fromJson(dynamic json){
    id=json['id'];
    title=json['title'];
    description=json['description'];
    url=json['url'];
    categoryId=json['category_id'];
    authorId=json['author_id'];
    authorName=json['author_name'];
    imageUrl=json['image_url'];
  }
}