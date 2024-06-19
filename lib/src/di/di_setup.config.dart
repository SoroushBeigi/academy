// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/data/local/shared_pref.dart' as _i7;
import '../core/locale_provdier.dart' as _i8;
import '../core/resources/theme/theme_bloc.dart' as _i3;
import '../features/add/data/upload_video/upload_video.dart' as _i13;
import '../features/add/domain/repository/upload_video_repository.dart' as _i14;
import '../features/add/presentation/cubit/add_cubit.dart' as _i15;
import '../features/auth/presentation/cubit/auth_cubit.dart' as _i4;
import '../features/favourite/presentation/cubit/favourite_cubit.dart' as _i9;
import '../features/home/presentation/bloc/home_cubit.dart' as _i10;
import '../features/main/presentation/bloc/main_cubit.dart' as _i11;
import '../features/profile/presentation/cubit/profile_cubit.dart' as _i5;
import '../features/search/presentation/cubit/search_cubit.dart' as _i12;
import '../features/video_details/presentation/bloc/video_details_cubit.dart'
    as _i6;

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
  gh.factory<_i6.VideoDetailsCubit>(() => _i6.VideoDetailsCubit());
  gh.singleton<_i7.Storage>(() => _i7.Storage());
  gh.singleton<_i8.LocaleProvider>(() => _i8.LocaleProvider());
  gh.singleton<_i9.FavouriteCubit>(() => _i9.FavouriteCubit());
  gh.singleton<_i10.HomeCubit>(() => _i10.HomeCubit());
  gh.singleton<_i11.MainCubit>(() => _i11.MainCubit());
  gh.singleton<_i12.SearchCubit>(() => _i12.SearchCubit());
  gh.lazySingleton<_i13.UploadDataSource>(() => _i13.UploadDataSource());
  gh.lazySingleton<_i14.UploadRepository>(() =>
      _i14.UploadRepository(uploadDataSource: gh<_i13.UploadDataSource>()));
  gh.factory<_i15.AddCubit>(() => _i15.AddCubit(gh<_i14.UploadRepository>()));
  return getIt;
}
