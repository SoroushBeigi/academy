// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/data/local/shared_pref.dart' as _i3;
import '../core/resources/theme/theme_bloc.dart' as _i4;
import '../features/add/presentation/cubit/add_cubit.dart' as _i5;
import '../features/auth/presentation/cubit/auth_cubit.dart' as _i6;
import '../features/home/presentation/bloc/home_cubit.dart' as _i7;
import '../features/profile/presentation/cubit/profile_cubit.dart' as _i8;
import '../features/splash/presentation/bloc/splash_cubit.dart' as _i9;
import '../features/video_details/presentation/bloc/video_details_cubit.dart'
    as _i10;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.Storage>(() => _i3.Storage());
  gh.factory<_i4.ThemeBloc>(() => _i4.ThemeBloc());
  gh.factory<_i5.AddCubit>(() => _i5.AddCubit());
  gh.factory<_i6.AuthCubit>(() => _i6.AuthCubit());
  gh.factory<_i7.HomeCubit>(() => _i7.HomeCubit());
  gh.factory<_i8.ProfileCubit>(() => _i8.ProfileCubit());
  gh.factory<_i9.SplashCubit>(() => _i9.SplashCubit());
  gh.factory<_i10.VideoDetailsCubit>(() => _i10.VideoDetailsCubit());
  return getIt;
}
