import 'package:academy/src/features/home/presentation/widgets/video_card.dart';
import 'package:flutter/material.dart';


class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final crossCount = (MediaQuery.of(context).size.width ~/ 350).toInt();
    return Scaffold(
        body: GridView.count(
          crossAxisCount: crossCount==0? 1 : crossCount,
          childAspectRatio: 1.18,
          children: const [
            VideoCard(isSaved: true),
            VideoCard(isSaved: true),
            VideoCard(isSaved: true),
          ],
        )
    );
  }
}
