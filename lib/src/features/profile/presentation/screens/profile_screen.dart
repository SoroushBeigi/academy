import 'package:academy/src/core/locale_provdier.dart';
import 'package:academy/src/core/resources/theme/theme_bloc.dart';
import 'package:academy/src/core/widgets/change_theme_icon.dart';
import 'package:academy/src/di/di_setup.dart';
import 'package:academy/src/features/core/core.dart';
import 'package:academy/src/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:academy/src/features/profile/presentation/cubit/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localeProvider = context.read<LocaleProvider>();
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).profileSettings),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 60,
                margin: const EdgeInsets.all(4),
                child: Card(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      final themeBloc = BlocProvider.of<ThemeBloc>(context);
                      if (themeBloc.isDark) {
                        themeBloc.add(SwitchToLightEvent());
                      } else {
                        themeBloc.add(SwitchToDarkEvent());
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(AppLocalizations.of(context).appTheme),
                          const ChangeThemeIcon(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(4),
                height: 60,
                child: Card(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      if (localeProvider.locale == const Locale('en')) {
                        localeProvider.changeLocale(const Locale('fa'));
                      } else {
                        localeProvider.changeLocale(const Locale('en'));
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppLocalizations.of(context).appLanguage,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              AppLocalizations.of(context).oppositeLanguage,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  return Container(
                      margin: const EdgeInsets.all(4),
                      height: 60,
                      child: Card(
                        color:
                            Theme.of(context).colorScheme.surfaceContainerHigh,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () {
                            getIt<ProfileCubit>().logout();
                          },
                          child: state.whenOrNull(logoutLoading: () => const ACLoading(),)??
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context).logout,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurface),
                                    ),
                                  ],
                                ),
                              ),
                        ),
                      ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
