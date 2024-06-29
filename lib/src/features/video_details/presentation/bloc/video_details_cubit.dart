import 'dart:convert';
import 'package:academy/src/core/data/local/shared_pref.dart';
import 'package:academy/src/di/di_setup.dart';
import 'package:academy/src/features/saved/domain/entity/content/response/content_response_entity.dart';
import 'package:academy/src/features/saved/domain/entity/entity.dart';
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

  final _storage = getIt<Storage>();

  static String url = '';
  List<ContentResponseEntity> relatedContent = [];
  List<ContentResponseEntity> savedContentList = [];

  static final ValueNotifier<bool> savedNotifier = ValueNotifier(false);

  final _dio = Dio(
    BaseOptions(
      baseUrl: AppConstants.baseUrl,
      headers: {'Content-Type': 'application/json'},
    ),
  );

  Future setSaveContent({required int contentId}) async {
    List<int> listContentId = [];
    String? encodedData = _storage.getSavedContent();
    if (encodedData.isNotEmpty) {
      listContentId = (jsonDecode(encodedData) as List<dynamic>)
          .map((e) => e as int)
          .toList();
    }
    listContentId.add(contentId);
    String decodedData = jsonEncode(listContentId);
    await _storage.setSavedContent(decodedData);
  }

  Future removeSaveContent({required int contentId}) async {
    List<int> listContentId = [];
    String? encodedData = _storage.getSavedContent();
    if (encodedData.isNotEmpty) {
      listContentId = (jsonDecode(encodedData) as List<dynamic>)
          .map((e) => e as int)
          .toList();
      listContentId.remove(contentId);
      String decodedData = jsonEncode(listContentId);
      await _storage.remove(AppConstants.saveContentList);
      await _storage.setSavedContent(decodedData);
    }
  }

  Future getSaveContent({required ContentResponseEntity entity}) async {
    emit(const VideoDetailsState.loading());
    try {
      savedNotifier.value = false;
      savedContentList.clear();
      List<int> listContentId = [];
      String? encodedData = _storage.getSavedContent();
      if (encodedData.isNotEmpty) {
        listContentId = (jsonDecode(encodedData) as List<dynamic>).map((e) => e as int).toList();
      }
        for(var j in listContentId) {
          if(entity.id == j) {
            savedNotifier.value = true;
          }
        }
      emit(const VideoDetailsState.success());
    }catch(e) {
      emit(VideoDetailsState.error(errorMessage: e.toString()));
    }
  }

  Future<void> like(bool isLiked, int contentId) async {
    final result = await _dio.post('/content/likes/$contentId', data: {
      'content_id': contentId,
      'liked': isLiked,
    });
    print(result.data);
  }

  Future<void> getRelatedContent(ContentResponseEntity entity) async {
    relatedContent.clear();
    if (entity.relatedContentIds == null ||
        (entity.relatedContentIds?.isEmpty ?? true)) {
      getSaveContent(entity: entity);
      return;
    }
    emit(const VideoDetailsState.loading());
    for (var contentId in entity.relatedContentIds!) {
      try {
        final result = await _dio.get('/content/$contentId');
        relatedContent
            .add(ContentResponseEntity.fromJson(json.decode(result.data)));
        print('related content added');
      } catch (e) {
        debugPrint(e.toString());
      }
    }
    getSaveContent(entity: entity);
    print('emitted');
    print(relatedContent);
  }
}
