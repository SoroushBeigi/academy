import 'package:academy/src/core/widgets/responsive_widget/responsive_widget.dart';
import 'package:academy/src/di/di_setup.dart';
import 'package:academy/src/features/core/ui_kits/ac_elevated_button/ac_elevated_button.dart';
import 'package:academy/src/features/core/ui_kits/ac_loading/ac_loading.dart';
import 'package:academy/src/features/new_content/new_content.dart';


class NewContentPage extends StatefulWidget {
  const NewContentPage({super.key});

  @override
  State<NewContentPage> createState() => _NewContentPageState();
}

class _NewContentPageState extends State<NewContentPage> {
  @override
  Widget build(BuildContext context) {
    final textLocalization = AppLocalizations.of(context);
    return BlocProvider(
      create: (BuildContext context) =>
          getIt<NewContentCubit>()..getAllContents(),
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: BlocConsumer<NewContentCubit, NewContentState>(
          listener: (BuildContext context, NewContentState state) {
            state.whenOrNull(
              successAddNewContent: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    child: Padding(
                      padding: const EdgeInsets.all(AppPadding.p16),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(textLocalization.successfulAddNewContent),
                            Space.h16,
                            ACElevatedButton(
                              onTap: () {
                                context.pop();
                              },
                              child: Text(
                                textLocalization.accept,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surface),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
          builder: (BuildContext context, state) {
            return state.whenOrNull(
                  loading: () => const ACLoading(),
                  success: () => ResponsiveWidget(
                    smallScreen: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${textLocalization.newContent}:',
                          style: Theme.of(context).textTheme.titleMedium,
                          textAlign: TextAlign.start,
                        ),
                        Space.h16,
                        const NewContentWidgetPhone()
                      ],
                    ),
                    largeScreen: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${textLocalization.newContent}:',
                            style: Theme.of(context).textTheme.titleMedium,
                            textAlign: TextAlign.start,
                          ),
                          Space.h16,
                          LayoutBuilder(builder: (context, constraints) {
                            double containerWidth = constraints.maxWidth;
                            return Container(
                              width: containerWidth >= 1350 ? containerWidth * 0.5 : (containerWidth < 1350 && containerWidth > 1150) ? containerWidth * 0.6 : (containerWidth < 1150 && containerWidth > 1050) ? containerWidth * 0.7 : (containerWidth < 1050 && containerWidth > 950) ? containerWidth * 0.8 : containerWidth * 0.9,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.surface,
                                borderRadius: BorderRadius.circular(AppSize.s12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(AppPadding.p16),
                                child: NewContentWidgetWeb(),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                ) ??
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${textLocalization.newContent}:',
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.start,
                    ),
                    Space.h16,
                    LayoutBuilder(builder: (context, constraints) {
                      double containerWidth = constraints.maxWidth * 0.5;
                      return Container(
                        width: containerWidth,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.circular(AppSize.s12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(AppPadding.p16),
                          child: NewContentWidgetWeb(),
                        ),
                      );
                    }),
                  ],
                );
          },
        ),
      ),
    );
  }
}
