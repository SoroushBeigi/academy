import 'package:academy/src/core/data/local/shared_pref.dart';
import 'package:academy/src/di/di_setup.dart';
import 'package:academy/src/features/profile/presentation/cubit/profile_state.dart';
import 'package:academy/src/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';


@injectable
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState.initial());

  Future<void> logout() async {
    emit(const ProfileState.logoutLoading());
    getIt<Storage>().setLoggedIn(false);
    Routes.parentNavigatorKey.currentContext?.push('/');
  }
}
