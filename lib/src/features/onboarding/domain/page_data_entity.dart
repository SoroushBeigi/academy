import 'package:flutter/material.dart';

class PageData {
  final String? title;
  final String? imagePath;
  final Color bgColor;
  final Color textColor;

  const PageData({
    this.title,
    this.bgColor = Colors.white,
    this.textColor = Colors.black,
    this.imagePath,
  });
}
