import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';
part 'theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  bool isDark = false;


  ThemeBloc() : super(LightThemeState()) {
    on<SwitchToDarkEvent>(_switchToDark);
    on<SwitchToLightEvent>(_switchToLight);
  }

  void _switchToDark(SwitchToDarkEvent event, Emitter<ThemeState> emit) {
    isDark = true;
    emit(DarkThemeState());
  }

  void _switchToLight(SwitchToLightEvent event, Emitter<ThemeState> emit) {
    isDark = false;
    emit(LightThemeState());
  }


}
