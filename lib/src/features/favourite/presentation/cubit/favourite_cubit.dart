import 'dart:convert';
import 'package:academy/src/core/data/local/shared_pref.dart';
import 'package:academy/src/di/di_setup.dart';
import 'package:academy/src/features/favourite/domain/repository/repository.dart';
import 'package:academy/src/features/favourite/domain/entity/content/response/content_response_entity.dart';
import 'package:academy/src/features/favourite/presentation/cubit/favourite_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class FavouriteCubit extends Cubit<FavouriteState> {
  final GetAllContentRepository getAllContentRepository;
  final _storage = getIt<Storage>();

  FavouriteCubit(this.getAllContentRepository) : super(const FavouriteState.loading());


  List<ContentResponseEntity> savedContentList = [];

  List<ContentResponseEntity> contentList = [];

  Future getAllContents() async{
    emit(const FavouriteState.loading());
    final result = await getAllContentRepository.getAllContent();
    result.whenOrNull(
      success: (data) async{
        for(var i in data) {
          contentList.add(i);
        }
      },
      failure: (error) {
        emit(FavouriteState.error(errorMessage: error ?? ''));
      },
    );
  }

  Future getSaveContent() async {
    emit(const FavouriteState.loading());
    try {
      await getAllContents();
      List<int> listContentId = [];
      String? encodedData = _storage.getSavedContent();
      if (encodedData.isNotEmpty) {
        listContentId = (jsonDecode(encodedData) as List<dynamic>).map((e) => e as int).toList();
      }
      print(listContentId);
      for(var i in contentList) {
        for(var j in listContentId) {
          if(i.id == j) {
            savedContentList.add(i);
          }
        }
      }
      print(savedContentList);
      emit(const FavouriteState.success());
    }catch(e) {
      emit(FavouriteState.error(errorMessage: e.toString()));
    }
  }
}
