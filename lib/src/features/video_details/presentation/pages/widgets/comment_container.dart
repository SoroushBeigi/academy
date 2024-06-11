import 'package:academy/src/core/extensions/extensions.dart';
import 'package:academy/src/core/resources/value_manager.dart';
import 'package:flutter/material.dart';

class CommentContainer extends StatelessWidget {
  const CommentContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Column(
        children: [
          AppSize.s16.heightSizeBox(),
          Row(
            children: [
              Container(
                width: AppSize.s28,
                height: AppSize.s28,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.onSecondary),
                child: const Center(child: Icon(Icons.person)),
              ),
              AppSize.s4.widthSizeBox(),
              Text(
                '@AhSoleimani',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const Spacer(),
              Text(
                '5d ago',
                style: Theme.of(context).textTheme.bodyMedium,
              )
            ],
          ),
          AppSize.s8.heightSizeBox(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
            child: Row(
              children: [
                Text(
                  'This is a good tutorial',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.reply,
                      color: Theme.of(context).colorScheme.secondary,
                      size: AppSize.s28,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
