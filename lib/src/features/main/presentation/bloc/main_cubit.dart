import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../bottom_navigation/src/bottom_controller.dart';
part 'main_state.dart';

@singleton
class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const MainState(currentIndex: 0,isExtended: false));

  final controller = BottomController(index: 0);
  bool isExtended = false;
  int selectedIndex = 0;

  void updateNavigationIndexState(int index) {
    selectedIndex=index;
    controller.jumpTo(index);
    emit(MainState(currentIndex: index,isExtended: isExtended));
  }

  void switchExtended(){
    isExtended=!isExtended;
    emit(MainState(currentIndex: selectedIndex,isExtended: isExtended));
  }

}