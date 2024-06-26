import 'package:academy/src/core/resources/resources.dart';
import 'package:academy/src/di/di_setup.dart';
import 'package:academy/src/features/core/ui_kits/ac_elevated_button/ac_elevated_button.dart';
import 'package:academy/src/features/core/ui_kits/ac_loading/ac_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import '../../new_content.dart';

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
                  success: () => SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          '${textLocalization.newContent}:',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Space.h8,
                        const NewContentWidget()
                      ],
                    ),
                  ),
                ) ??
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        '${textLocalization.newContent}:',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Space.h8,
                      const NewContentWidget()
                    ],
                  ),
                );
          },
        ),
      ),
    );
  }
}
