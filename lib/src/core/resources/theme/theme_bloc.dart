import 'package:academy/src/core/data/local/shared_pref.dart';
import 'package:academy/src/di/di_setup.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'theme_state.dart';

part 'theme_event.dart';

@injectable
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  bool isDark = getIt<Storage>().isDark();

  ThemeBloc() : super(LightThemeState()) {
    on<SwitchToDarkEvent>(_switchToDark);
    on<SwitchToLightEvent>(_switchToLight);
  }

  void _switchToDark(SwitchToDarkEvent event, Emitter<ThemeState> emit) {
    isDark = true;
    getIt<Storage>().setIsDark(true);
    emit(DarkThemeState());
  }

  void _switchToLight(SwitchToLightEvent event, Emitter<ThemeState> emit) {
    isDark = false;
    getIt<Storage>().setIsDark(false);
    emit(LightThemeState());
  }
}
