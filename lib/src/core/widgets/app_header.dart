import 'package:academy/src/core/data/local/shared_pref.dart';
import 'package:academy/src/core/resources/value_manager.dart';
import 'package:academy/src/di/di_setup.dart';
import 'package:academy/src/features/main/presentation/bloc/main_cubit.dart';
import 'package:academy/src/features/search/presentation/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({required this.textFieldEnabled,required this.textFieldAutoFocus,super.key});
  final bool textFieldEnabled;
  final bool textFieldAutoFocus;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ///logo
        Container(
          padding: const EdgeInsets.only(left:8),
          height: 50,
          child: Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    'assets/icon.png',
                  )),
              // AppSize.s4.widthSizeBox(),
              Text(
                AppLocalizations.of(context).academy,
                style: const TextStyle(
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),

        ///search
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 40, vertical: 16),
            child: GestureDetector(
              onTap: () {
                context.go('/search',extra: {'isFromHome':true,'selectedChip': null});
                context
                    .read<MainCubit>()
                    .updateNavigationIndexState(1);
              },
              child:  SearchField(
                enabled: textFieldEnabled,
                autoFocus: textFieldAutoFocus,
              ),
            ),
          ),
        ),

        ///user
        IntrinsicHeight(
          child: Row(
            children: [
              Stack(
                children: [
                  const Icon(
                    Icons.notifications,
                    size: AppSize.s28,
                  ),
                  Container(
                    width: AppSize.s16,
                    height: AppSize.s16,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            AppSize.s60),
                        color: Colors.red),
                    child: const Center(
                        child: Text('2',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 8))),
                  )
                ],
              ),
              Space.w8,
              VerticalDivider(
                thickness: AppSize.s1,
                width: AppSize.s1,
                color:
                Theme.of(context).colorScheme.tertiary,
              ),
              Space.w8,
              InkWell(
                onTap: () {
                  context.go('/profile', extra: true);
                  context
                      .read<MainCubit>()
                      .updateNavigationIndexState(4);
                },
                child: Row(
                  children: [
                    Container(
                      width: AppSize.s42,
                      height: AppSize.s42,
                      decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(AppSize.s60),
                          color: Theme.of(context)
                              .colorScheme
                              .secondaryContainer),
                      child: const Center(
                        child: Icon(
                          Icons.person,
                        ),
                      ),
                    ),
                    Space.w8,
                    Text(
                      getIt<Storage>().getUsername(),
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 10),
                    ),
                    Space.w16,
                  ],
                ),
              ),


            ],
          ),
        ),

        InkWell(
          onTap: () {
            context.pushNamed('/meeting');
          },
          child: Text('meeting'),
        )
      ],
    );
  }
}
