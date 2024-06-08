import 'package:academy/src/core/data/local/shared_pref.dart';
import 'package:academy/src/core/resources/app_constants.dart';
import 'package:academy/src/di/di_setup.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_state.dart';

part 'auth_cubit.freezed.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState.initial());

  final _dio = Dio(
      // BaseOptions(
      //   baseUrl: AppConstants.baseUrl,
      //   headers: {'Content-Type': 'application/json'},
      // ),
      );

  Future<String?> register(String email, String password, String username) async {
    try {
      final result = await _dio.post(AppConstants.baseUrl + '/users',
          data: {
            'email': email,
            'username': username,
            'password': password,
          },
          options: Options(headers: {'Content-Type': 'application/json'}));
      if(result.statusCode==200 || result.statusCode==201){
        return null;
      }else{
        setLoggedIn();
        return 'Registration failed';
      }
    }on DioException catch(e){
      return 'Registration failed';
    }

  }

  Future<void> login() async {
    setLoggedIn();
  }

  Future<void> setLoggedIn() async {
    getIt<Storage>().setLoggedIn(true);
  }
}
