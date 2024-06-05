import 'package:academy/src/core/widgets/change_theme_icon.dart';
import 'package:academy/src/features/learning/presentation/widgets/learning_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LearningScreen extends StatelessWidget {
  const LearningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const ChangeThemeIcon()),
      body: SingleChildScrollView(
        child: Column(

        ),
      ),
    );
  }
}
