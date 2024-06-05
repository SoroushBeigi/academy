import 'package:academy/src/core/widgets/change_theme_icon.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const ChangeThemeIcon()
      ),
      body: Center(child: TextButton(
          onPressed: () {
            context.pushNamed('videoDetails');
          },
          child: const Text('Home')),)
    );
  }
}
