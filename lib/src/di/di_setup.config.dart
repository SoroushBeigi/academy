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
import '../features/add/data/upload_video/upload_video.dart' as _i8;
import '../features/add/domain/repository/upload_video_repository.dart' as _i9;
import '../features/add/presentation/cubit/add_cubit.dart' as _i10;
import '../features/auth/presentation/cubit/auth_cubit.dart' as _i4;
import '../features/home/presentation/bloc/home_cubit.dart' as _i5;
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
  gh.factory<_i3.Storage>(() => _i3.Storage());
  gh.factory<_i4.AuthCubit>(() => _i4.AuthCubit());
  gh.factory<_i5.HomeCubit>(() => _i5.HomeCubit());
  gh.factory<_i6.SplashCubit>(() => _i6.SplashCubit());
  gh.factory<_i7.VideoDetailsCubit>(() => _i7.VideoDetailsCubit());
  gh.lazySingleton<_i8.UploadDataSource>(() => _i8.UploadDataSource());
  gh.lazySingleton<_i9.UploadRepository>(
      () => _i9.UploadRepository(uploadDataSource: gh<_i8.UploadDataSource>()));
  gh.factory<_i10.AddCubit>(() => _i10.AddCubit(gh<_i9.UploadRepository>()));
  return getIt;
}
