import 'package:flutter/material.dart';



class Label extends StatelessWidget {
  final String title;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  const Label(this.title, {this.textStyle, this.textAlign, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: textStyle,
      textAlign: textAlign,
    );
  }
}

class ImageWidget extends StatelessWidget {
  final String path;
  final Color? color;
  final double? width;
  final double? height;
  final BoxFit? boxFit;
  const ImageWidget({required this.path, Key? key, this.color, this.width, this.height, this.boxFit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      fit: BoxFit.fill,
      color: color,
      width: width,
      height: height,
    );
  }
}

class IconWidget extends StatelessWidget {
  const IconWidget({super.key, required this.iconData, this.size, this.color});
  final IconData iconData;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      size: size,
      color: color,
    );
  }
}



