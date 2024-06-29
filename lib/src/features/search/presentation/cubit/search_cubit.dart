import 'package:academy/src/di/di_setup.dart';
import 'package:academy/src/features/search/presentation/cubit/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../home/presentation/bloc/home_cubit.dart';

@singleton
class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(const SearchState.initial());

  Map<String, bool> chips = {};
  String query = '';

  void search(String value) {
    if (value == '' || value == ' ') {
      if(!chips.entries.any((element) => element.value)){
        emit(const SearchState.initial());
        return;
      }else{
        emit(SearchState.chipsChanged(chips));
      }

    }
    query = value;
    final videos = HomeCubit.videos;
    final foundVideos = videos
        .where((element) => element.title?.contains(value) ?? false)
        .toList();
    MapEntry<String, bool> mapEntry = const MapEntry('',false);
    if(chips.entries.any((element) {
      if(element.value){
        mapEntry=element;
        return true;
      }else{
        return false;
      }
    })){
      final videosWithChips = foundVideos.where((content) => content.categories?.any((category) =>category.name==mapEntry.key) ?? false).toList();
      emit(SearchState.foundVideos(videosWithChips));
    }else{
      emit(SearchState.foundVideos(foundVideos));
    }

  }

  void switchChips(String key, bool value) {
    chips = HomeCubit.chips;
    for (var element in chips.entries) {
      chips[element.key] = false;
    }
    chips[key] = value;

    ///has no selected chip!
    if (!(chips[key] ?? false)) {
      print('1');
      emit(SearchState.chipsChanged(chips));
      if(query!='' && query.trim()!= ''){
        print('2');
        final searchResult = HomeCubit.videos.where((element) =>element.title?.contains(query) ?? false).toList();
        emit(SearchState.foundVideos(searchResult));
      }else {
        print('3');
        emit(const SearchState.initial());
      }
    } else{
      print('4');
      final videos = HomeCubit.videos;
    final foundVideos = videos.where((element) =>
    element.categories?.any((category) => category.name == key,) ?? false,)
        .toList();
      emit(SearchState.chipsChanged(chips));
    if(query!='' && query.trim()!= '') {
      print('5');
      final searchResult = foundVideos.where((element) =>element.title?.contains(query) ?? false).toList();
      emit(SearchState.foundVideos(searchResult));
    }else{
      print('6');
      emit(SearchState.foundVideos(foundVideos));
    }
  }
}

void selectChip(String chipName) {
  chips = HomeCubit.chips;
  for (var element in chips.entries) {
    chips[element.key] = false;
  }
  final foundChip = chips.entries.firstWhere((element) =>
  element.key == chipName,);
  chips[foundChip.key] = true;


  final videos = HomeCubit.videos;
  final foundVideos = videos.where((element) =>
  element.categories?.any((category) => category.name == chipName,) ?? false,)
      .toList();
  emit(SearchState.chipsChanged(chips));
  emit(SearchState.foundVideos(foundVideos));
}

Future<void> initialLoad()async{
  emit(const SearchState.loading());
  await getIt<HomeCubit>().getCategories();
  await getIt<HomeCubit>().getVideos();
  emit(const SearchState.initial());
}


}
