import 'package:academy/src/core/widgets/change_theme_icon.dart';
import 'package:academy/src/features/home/presentation/widgets/video_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final crossCount = (MediaQuery.of(context).size.width ~/ 350).toInt();
    return Scaffold(
        appBar: AppBar(title: const ChangeThemeIcon()),
        body: GridView.count(
          crossAxisCount: crossCount==0? 1 : crossCount,
          childAspectRatio: 1.18,
          children: const [
           VideoCard(),
           VideoCard(),
           VideoCard(),
           VideoCard(),
           VideoCard(),
           VideoCard(),
           VideoCard(),
           VideoCard(),
           VideoCard(),

          ],
        ));
  }
}
