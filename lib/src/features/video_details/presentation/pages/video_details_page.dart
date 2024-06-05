import 'package:academy/src/core/extensions/extensions.dart';
import 'package:academy/src/core/resources/resources.dart';
import 'package:academy/src/core/resources/value_manager.dart';
import 'package:academy/src/features/video_details/presentation/pages/widgets/video_player.dart';
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
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s12),
              ),
              child: const ExampleCard(title: 'lll',),
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: const Icon(Icons.thumb_up_alt_outlined),
                          ),
                          VerticalDivider(
                            thickness: 2,
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
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.share),
                          (AppSize.s4).widthSizeBox(),
                          const Text('Share')
                        ],
                      ),
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
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.bookmark_border),
                          (AppSize.s4).widthSizeBox(),
                          const Text('Save')
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            (AppSize.s12).heightSizeBox(),
            Container(
              padding: const EdgeInsets.all(AppPadding.p8),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s12),
                color: Theme.of(context).colorScheme.surfaceContainer,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Comment',style: Theme.of(context).textTheme.titleMedium,),
                  (AppSize.s8).heightSizeBox(),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppSize.s12),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      hintText: 'Add a comment...'
                    ),
                  )
                ],
              ),
            ),
            ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: AppPadding.p12),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.s12),
                    color: Colors.red,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: AppPadding.p12),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.s12),
                    color: Colors.red,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: AppPadding.p12),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.s12),
                    color: Colors.red,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
