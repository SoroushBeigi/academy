import 'dart:convert';

import 'package:academy/content_entity.dart';
import 'package:academy/src/core/data/local/shared_pref.dart';
import 'package:academy/src/di/di_setup.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
  List<ContentEntity> relatedContent = [];

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

  Future<void> getRelatedContent(ContentEntity entity) async {
    relatedContent.clear();
    if (entity.relatedContent == null) {
      return;
    }
    emit(const VideoDetailsState.loading());
    for (var contentId in entity.relatedContent!) {
      try {
        final result = await _dio.get('/content/$contentId');
        relatedContent.add(ContentEntity.fromJson(json.decode(result.data)));
        print('related content added');
      } catch (e) {
        debugPrint(e.toString());
      }
    }
    emit(const VideoDetailsState.done());
    print('emitted');
    print(relatedContent);
  }
}
