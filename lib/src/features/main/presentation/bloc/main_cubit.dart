import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const MainState(currentIndex: 0));


  void updateNavigationIndexState(int index) {
    if(index==3){

    }
    emit(MainState(currentIndex: index));
  }

}