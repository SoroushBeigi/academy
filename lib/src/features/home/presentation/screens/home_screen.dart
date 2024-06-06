import 'package:academy/src/features/home/presentation/widgets/video_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final crossCount = (MediaQuery.of(context).size.width ~/ 350).toInt();
    return Scaffold(
      appBar: AppBar(title: const Text('Academy')),
      body: GridView.count(
        crossAxisCount: crossCount == 0 ? 1 : crossCount,
        childAspectRatio: 1.18,
        children: const [
          VideoCard(isSaved: false,isLive: true,),
          VideoCard(isSaved: true),
          VideoCard(isSaved: true),
          VideoCard(isSaved: false),
          VideoCard(isSaved: false),
          VideoCard(isSaved: false),
          VideoCard(isSaved: false),
          VideoCard(isSaved: false),
          VideoCard(isSaved: false),
          VideoCard(isSaved: false),
        ],
      ),
    );
  }
}
