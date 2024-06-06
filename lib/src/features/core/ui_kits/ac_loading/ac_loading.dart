import 'package:academy/src/core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class ACLoading extends StatelessWidget {
  const ACLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitCircle(
        duration: AppTimes().t600,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}