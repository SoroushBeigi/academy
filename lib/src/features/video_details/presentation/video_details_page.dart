import 'package:academy/src/core/extensions/extensions.dart';
import 'package:academy/src/core/resources/resources.dart';
import 'package:flutter/material.dart';

class VideoDetails extends StatelessWidget {
  const VideoDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.4,
              color: Colors.red,
            ),
            Divider(
              thickness: AppSize.s1,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            Text(
              'How to do learning Golang',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '12k views 5d ago',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      '...more',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.primary),
                    ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: AppPadding.p4),
                      padding: const EdgeInsets.all(AppPadding.p6),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceContainer,
                        borderRadius: BorderRadius.circular(AppSize.s60),
                      ),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: const Icon(Icons.thumb_up_alt_outlined),
                          ),
                          VerticalDivider(
                            thickness: 1,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Icon(Icons.thumb_down_alt_outlined),
                          ),
                        ],
                      ),
                    ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: AppPadding.p4),
                    padding: const EdgeInsets.all(AppPadding.p6),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surfaceContainer,
                      borderRadius: BorderRadius.circular(AppSize.s60),
                    ),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: const Icon(Icons.thumb_up_alt_outlined),
                        ),
                        VerticalDivider(
                          thickness: 1,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Icon(Icons.thumb_down_alt_outlined),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: AppPadding.p4),
                    padding: const EdgeInsets.all(AppPadding.p6),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surfaceContainer,
                      borderRadius: BorderRadius.circular(AppSize.s60),
                    ),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: const Icon(Icons.thumb_up_alt_outlined),
                        ),
                        VerticalDivider(
                          thickness: 1,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Icon(Icons.thumb_down_alt_outlined),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
