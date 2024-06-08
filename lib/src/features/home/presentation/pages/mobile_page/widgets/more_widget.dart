import 'package:academy/src/core/resources/resources.dart';
import 'package:academy/src/features/features.dart';
import 'package:flutter/material.dart';

class MoreWidget extends StatefulWidget {
  const MoreWidget({super.key});

  @override
  State<MoreWidget> createState() => _MoreWidgetState();
}

class _MoreWidgetState extends State<MoreWidget> {



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      },
      child: Icon(
        Icons.more_vert_outlined,
        size: AppSize.s20,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
