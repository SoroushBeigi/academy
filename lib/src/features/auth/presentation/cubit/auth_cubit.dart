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
    BaseOptions(
      baseUrl: AppConstants.baseUrl,
      headers: {'Content-Type': 'application/json'},
    ),
  );

  Future<String?> register(
      String email, String password, String username) async {
    try {
      final result = await _dio.post(
        '/users',
        data: {
          'email': email,
          'username': username,
          'password': password,
        },
      );
      if (result.statusCode == 200 || result.statusCode == 201) {
        return null;
      } else {
        setLoggedIn();
        return 'Registration failed';
      }
    } on DioException catch (e) {
      return 'Registration failed';
    }
  }

  Future<String?> login(String email, String password) async {
    final result = await _dio.get('/users');
    final List<UserModel> users =(result.data as List).map((userJson) => UserModel.fromJson(userJson)).toList();
    for (var user in users) {
      if(user.email==email && user.password==password){
        setLoggedIn();
        return null;
      }
    }
    return 'Login Failed';
  }

  Future<void> setLoggedIn() async {
    getIt<Storage>().setLoggedIn(true);
  }
}

class UserModel{
  int? id;
  String? username;
  String? password;
  String? email;
  UserModel({this.id,this.username,this.password,this.email});
  UserModel.fromJson(dynamic json){
    id = json['ID'];
    username=json['Username'];
    password=json['Password'];
    email=json['Email'];
  }
}
