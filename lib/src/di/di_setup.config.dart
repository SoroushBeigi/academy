// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/data/local/shared_pref.dart' as _i8;
import '../core/resources/theme/theme_bloc.dart' as _i3;
import '../features/add/data/upload_video/upload_video.dart' as _i12;
import '../features/add/domain/repository/upload_video_repository.dart' as _i13;
import '../features/add/presentation/cubit/add_cubit.dart' as _i14;
import '../features/auth/presentation/cubit/auth_cubit.dart' as _i4;
import '../features/favourite/presentation/cubit/favourite_cubit.dart' as _i9;
import '../features/home/presentation/bloc/home_cubit.dart' as _i10;
import '../features/profile/presentation/cubit/profile_cubit.dart' as _i5;
import '../features/search/presentation/cubit/search_cubit.dart' as _i11;
import '../features/splash/presentation/bloc/splash_cubit.dart' as _i6;
import '../features/video_details/presentation/bloc/video_details_cubit.dart'
    as _i7;

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
  gh.factory<_i4.AuthCubit>(() => _i4.AuthCubit());
  gh.factory<_i5.ProfileCubit>(() => _i5.ProfileCubit());
  gh.factory<_i6.SplashCubit>(() => _i6.SplashCubit());
  gh.factory<_i7.VideoDetailsCubit>(() => _i7.VideoDetailsCubit());
  gh.singleton<_i8.Storage>(() => _i8.Storage());
  gh.singleton<_i9.FavouriteCubit>(() => _i9.FavouriteCubit());
  gh.singleton<_i10.HomeCubit>(() => _i10.HomeCubit());
  gh.singleton<_i11.SearchCubit>(() => _i11.SearchCubit());
  gh.lazySingleton<_i12.UploadDataSource>(() => _i12.UploadDataSource());
  gh.lazySingleton<_i13.UploadRepository>(() =>
      _i13.UploadRepository(uploadDataSource: gh<_i12.UploadDataSource>()));
  gh.factory<_i14.AddCubit>(() => _i14.AddCubit(gh<_i13.UploadRepository>()));
  return getIt;
}
