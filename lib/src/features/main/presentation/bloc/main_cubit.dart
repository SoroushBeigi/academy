import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bottom_navigation/src/bottom_controller.dart';
part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const MainState(currentIndex: 0));

  final controller = BottomController(index: 0);


  void updateNavigationIndexState(int index) {
    controller.jumpTo(index);
    emit(MainState(currentIndex: index));
  }

}