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
import '../features/add/data/upload_video/upload_video.dart' as _i12;
import '../features/add/domain/repository/upload_video_repository.dart' as _i19;
import '../features/add/presentation/cubit/add_cubit.dart' as _i23;
import '../features/auth/presentation/cubit/auth_cubit.dart' as _i4;
import '../features/favourite/data/content/content_data_source.dart' as _i15;
import '../features/favourite/domain/repository/content/content_repository.dart'
    as _i16;
import '../features/favourite/domain/repository/repository.dart' as _i21;
import '../features/favourite/presentation/cubit/favourite_cubit.dart' as _i20;
import '../features/home/presentation/bloc/home_cubit.dart' as _i9;
import '../features/main/presentation/bloc/main_cubit.dart' as _i10;
import '../features/new_content/data/category/get_category_data_source.dart'
    as _i13;
import '../features/new_content/data/content/get_all_content.dart' as _i14;
import '../features/new_content/domain/repository/category/get_category_repository.dart'
    as _i18;
import '../features/new_content/domain/repository/content/get_all_content.dart'
    as _i17;
import '../features/new_content/presentation/bloc/new_content_cubit.dart'
    as _i22;
import '../features/profile/presentation/cubit/profile_cubit.dart' as _i5;
import '../features/search/presentation/cubit/search_cubit.dart' as _i11;
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
  gh.singleton<_i9.HomeCubit>(() => _i9.HomeCubit());
  gh.singleton<_i10.MainCubit>(() => _i10.MainCubit());
  gh.singleton<_i11.SearchCubit>(() => _i11.SearchCubit());
  gh.lazySingleton<_i12.UploadDataSource>(() => _i12.UploadDataSource());
  gh.lazySingleton<_i13.GetCategoryDataSource>(
      () => _i13.GetCategoryDataSource());
  gh.lazySingleton<_i14.GetAllContentDataSource>(
      () => _i14.GetAllContentDataSource());
  gh.lazySingleton<_i15.GetAllContentDataSource>(
      () => _i15.GetAllContentDataSource());
  gh.lazySingleton<_i15.DeleteContentDataSource>(
      () => _i15.DeleteContentDataSource());
  gh.lazySingleton<_i15.PutContentDataSource>(
      () => _i15.PutContentDataSource());
  gh.lazySingleton<_i16.DeleteContentRepository>(() =>
      _i16.DeleteContentRepository(
          deleteContentDataSource: gh<_i15.DeleteContentDataSource>()));
  gh.lazySingleton<_i16.GetAllContentRepository>(() =>
      _i16.GetAllContentRepository(
          getAllContentDataSource: gh<_i15.GetAllContentDataSource>()));
  gh.lazySingleton<_i17.GetAllContentRepository>(() =>
      _i17.GetAllContentRepository(
          getAllContentDataSource: gh<_i14.GetAllContentDataSource>()));
  gh.lazySingleton<_i16.PutContentRepository>(() => _i16.PutContentRepository(
      putContentDataSource: gh<_i15.PutContentDataSource>()));
  gh.lazySingleton<_i18.GetCategoryRepository>(() => _i18.GetCategoryRepository(
      getCategoryDataSource: gh<_i13.GetCategoryDataSource>()));
  gh.lazySingleton<_i19.UploadRepository>(() =>
      _i19.UploadRepository(uploadDataSource: gh<_i12.UploadDataSource>()));
  gh.singleton<_i20.FavouriteCubit>(
      () => _i20.FavouriteCubit(gh<_i21.GetAllContentRepository>()));
  gh.factory<_i22.NewContentCubit>(() => _i22.NewContentCubit(
        gh<_i18.GetCategoryRepository>(),
        gh<_i17.GetAllContentRepository>(),
      ));
  gh.factory<_i23.AddCubit>(() => _i23.AddCubit(gh<_i19.UploadRepository>()));
  return getIt;
}
