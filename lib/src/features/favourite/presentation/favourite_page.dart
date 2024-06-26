import 'package:academy/src/core/widgets/responsive_widget/responsive_widget.dart';
import 'package:academy/src/features/core/core.dart';
import 'package:academy/src/features/favourite/presentation/cubit/favourite_cubit.dart';
import 'package:academy/src/features/favourite/presentation/pages/web/favourite_web_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di/di_setup.dart';
import 'cubit/favourite_state.dart';
import 'pages/mobile/favourite_mobile_page.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    print('/////////////');
    return BlocProvider(
      create: (_) => getIt<FavouriteCubit>()..getSaveContent(),
      child: BlocListener<FavouriteCubit, FavouriteState>(
        listener: (BuildContext context, FavouriteState state) {
        },
        child: BlocBuilder<FavouriteCubit, FavouriteState>(
          builder: (context, state) {
            print(state);
            return state.whenOrNull(
                loading: () => const ACLoading(),
                success: () => const ResponsiveWidget(
                  largeScreen: FavouriteWebPage(),
                  smallScreen: FavouriteMobilePage(),
                )
            ) ?? const SizedBox();
          },
        ),
      ),
    );
  }
}

