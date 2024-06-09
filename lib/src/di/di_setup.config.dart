// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/data/local/shared_pref.dart' as _i10;
import '../core/resources/theme/theme_bloc.dart' as _i3;
import '../features/add/presentation/cubit/add_cubit.dart' as _i4;
import '../features/auth/presentation/cubit/auth_cubit.dart' as _i5;
import '../features/favourite/presentation/cubit/favourite_cubit.dart' as _i6;
import '../features/home/presentation/bloc/home_cubit.dart' as _i11;
import '../features/profile/presentation/cubit/profile_cubit.dart' as _i7;
import '../features/search/presentation/cubit/search_cubit.dart' as _i12;
import '../features/splash/presentation/bloc/splash_cubit.dart' as _i8;
import '../features/video_details/presentation/bloc/video_details_cubit.dart'
    as _i9;

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
  gh.factory<_i3.ThemeBloc>(() => _i3.ThemeBloc());
  gh.factory<_i4.AddCubit>(() => _i4.AddCubit());
  gh.factory<_i5.AuthCubit>(() => _i5.AuthCubit());
  gh.factory<_i6.FavouriteCubit>(() => _i6.FavouriteCubit());
  gh.factory<_i7.ProfileCubit>(() => _i7.ProfileCubit());
  gh.factory<_i8.SplashCubit>(() => _i8.SplashCubit());
  gh.factory<_i9.VideoDetailsCubit>(() => _i9.VideoDetailsCubit());
  gh.singleton<_i10.Storage>(() => _i10.Storage());
  gh.singleton<_i11.HomeCubit>(() => _i11.HomeCubit());
  gh.singleton<_i12.SearchCubit>(() => _i12.SearchCubit());
  return getIt;
}
