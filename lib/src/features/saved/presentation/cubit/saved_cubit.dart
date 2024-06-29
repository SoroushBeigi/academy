import 'dart:convert';
import 'package:academy/src/core/data/local/shared_pref.dart';
import 'package:academy/src/di/di_setup.dart';
import 'package:academy/src/features/saved/saved.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class SavedCubit extends Cubit<SavedState> {
  final GetAllContentRepository getAllContentRepository;
  final _storage = getIt<Storage>();

  SavedCubit(this.getAllContentRepository) : super(const SavedState.loading());


  List<ContentResponseEntity> savedContentList = [];

  List<ContentResponseEntity> contentList = [];


  static final ValueNotifier<int> selectedIndex = ValueNotifier<int>(0);
  static final ValueNotifier<bool> rebuildNotifier = ValueNotifier<bool>(false);

  Future getAllContents() async{
    try{
      emit(const SavedState.loading());
      contentList.clear();
      final result = await getAllContentRepository.getAllContent();
      result.whenOrNull(
        success: (data) async{
          for(var i in data) {
            contentList.add(i);
          }
        },
        failure: (error) {
          emit(SavedState.error(errorMessage: error ?? ''));
        },
      );
    }catch(e) {
      emit(SavedState.error(errorMessage: e.toString()));
    }
  }

  Future getSaveContent() async {
    emit(const SavedState.loading());
    try {
      savedContentList.clear();
      await getAllContents();
      List<int> listContentId = [];
      String? encodedData = _storage.getSavedContent();
      if (encodedData.isNotEmpty) {
        listContentId = (jsonDecode(encodedData) as List<dynamic>).map((e) => e as int).toList();
      }
      for(var i in contentList) {
        for(var j in listContentId) {
          if(i.id == j) {
            savedContentList.add(i);
          }
        }
      }
      emit(const SavedState.success());
    }catch(e) {
      emit(SavedState.error(errorMessage: e.toString()));
    }
  }
}
