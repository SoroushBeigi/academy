import 'package:academy/src/core/data/local/shared_pref.dart';
import 'package:academy/src/di/di_setup.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState.initial());

  Future<void> setLoggedIn()async{
    getIt<Storage>().setLoggedIn(true);
  }
}
