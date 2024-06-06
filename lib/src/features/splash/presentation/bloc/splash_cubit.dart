import 'package:academy/src/core/data/local/shared_pref.dart';
import 'package:academy/src/di/di_setup.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState.initial());
  bool loggedIn = false;

  bool getLoggedIn(){
    return getIt<Storage>().getLoggedIn();
  }
  Future<void> setLoggedIn()async{
     getIt<Storage>().setLoggedIn(true);
  }
}
