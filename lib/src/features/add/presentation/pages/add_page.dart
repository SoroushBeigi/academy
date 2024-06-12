import 'package:academy/src/core/extensions/extensions.dart';
import 'package:academy/src/core/resources/resources.dart';
import 'package:academy/src/core/widgets/responsive_widget/responsive_widget.dart';
import 'package:academy/src/di/di_setup.dart';
import 'package:academy/src/features/add/presentation/cubit/add_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) {
    var bloc = getIt<AddCubit>();
    return bloc;
  },
  child: Scaffold(
      body: ResponsiveWidget(
        smallScreen: smallScreen(context ),
        mediumScreen: largeScreen(context),
        largeScreen: largeScreen(context),
      ),
    ),
);
  }

  smallScreen(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => context.push('/add/addVideo'),
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius:
                          const BorderRadius.only(topLeft: Radius.circular(30)),
                          color: colorScheme.primary),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.video_camera_back_rounded,
                            color: colorScheme.onPrimary,
                            size: 80,
                          ),
                          AppSize.s16.heightSizeBox(),
                          Text(
                            'Add video content (.mp4)',
                            textAlign: TextAlign.center,
                            style: styleHandler(true, context),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => getIt<AddCubit>().openFilePicker(),
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(30)),
                          color: colorScheme.primary),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.draw,
                            color: colorScheme.onPrimary,
                            size: 80,
                          ),
                          AppSize.s16.heightSizeBox(),
                          Text(
                            'Add doc content (.docx)',
                            textAlign: TextAlign.center,
                            style: styleHandler(true, context),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => getIt<AddCubit>().openFilePicker(),
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(30)),
                          color: colorScheme.primary),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.book,
                            color: colorScheme.onPrimary,
                            size: 80,
                          ),
                          AppSize.s16.heightSizeBox(),
                          Text(
                            'Add doc content (.pdf)',
                            textAlign: TextAlign.center,
                            style: styleHandler(true, context),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => getIt<AddCubit>().openFilePicker(),
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(30)),
                          color: colorScheme.primary),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.slideshow,
                            color: colorScheme.onPrimary,
                            size: 80,
                          ),
                          AppSize.s16.heightSizeBox(),
                          Text('Add slide content (.pptx)',
                              textAlign: TextAlign.center,
                              style: styleHandler(true, context)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          AppSize.s80.heightSizeBox()
        ],
      ),
    );
  }

  largeScreen(context,) {
    final colorScheme = Theme.of(context).colorScheme;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => context.push('/add/addVideo'),
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    height: height / 4,
                    width: width / 4,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.only(topLeft: Radius.circular(30)),
                        color: colorScheme.primary),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.video_camera_back_rounded,
                          color: colorScheme.onPrimary,
                          size: 80,
                        ),
                        AppSize.s16.heightSizeBox(),
                        Text(
                          'Add video content (.mp4)',
                          style: styleHandler(false, context),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => getIt<AddCubit>().openFilePicker(),
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    height: height / 4,
                    width: width / 4,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(30)),
                        color: colorScheme.primary),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.draw,
                          color: colorScheme.onPrimary,
                          size: 80,
                        ),
                        AppSize.s16.heightSizeBox(),
                        Text(
                          'Add doc content (.docx)',
                          style: styleHandler(false, context),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => getIt<AddCubit>().openFilePicker(),
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    height: height / 4,
                    width: width / 4,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(30)),
                        color: colorScheme.primary),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.book,
                          color: colorScheme.onPrimary,
                          size: 80,
                        ),
                        AppSize.s16.heightSizeBox(),
                        Text(
                          'Add doc content (.pdf)',
                          style: styleHandler(false, context),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => getIt<AddCubit>().openFilePicker(),
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    height: height / 4,
                    width: width / 4,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(30)),
                        color: colorScheme.primary),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.slideshow,
                          color: colorScheme.onPrimary,
                          size: 80,
                        ),
                        AppSize.s16.heightSizeBox(),
                        Text('Add slide content (.pptx)',
                            style: styleHandler(false, context)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextStyle styleHandler(bool isPhone, context) {
    if (isPhone) {
      return Theme.of(context).textTheme.titleMedium!.copyWith(
          color: Theme.of(context).colorScheme.onPrimary,
          fontWeight: FontWeight.w600);
    } else {
      return Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.onPrimary,
          fontWeight: FontWeight.w600);
    }
  }
}
