import 'dart:math';
import 'package:academy/src/core/widgets/widgets.dart';
import 'package:flutter/material.dart';



extension SizeContext on BuildContext {

  /// Returns same as MediaQuery.of(context)
  MediaQueryData get mq => MediaQuery.of(this);

  /// Returns same as MediaQuery.of(context).size
  Size get sizePx => mq.size;

  /// Returns same as MediaQuery.of(context).size.width
  double get widthPx => sizePx.width;

  /// Returns same as MediaQuery.of(context).height
  double get heightPx => sizePx.height;

  /// Returns diagonal screen pixels
  double get diagonalPx {
    final Size size = sizePx;
    return sqrt((size.width * size.width) + (size.height * size.height));
  }
}


extension ContextExtension on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}

extension StringExtension on String {
  Widget toLabel({TextStyle? textStyle, TextAlign? textAlign}) => Label(this,textStyle: textStyle, textAlign: textAlign);
  Widget imageWidget({Color? color,double? width,double? height,BoxFit? boxFit}) => ImageWidget(path: this,color: color,width: width,height: height, boxFit: boxFit);
}

extension IconDataExtension on IconData {
  Widget iconWidget({Color? color,double? size}) => IconWidget(iconData: this, color: color, size: size,);
}


extension DoubleExtension on double {
  Widget heightSizeBox() => SizedBox(height: this);
  Widget widthSizeBox() => SizedBox(width: this);
}

extension WidgetExtension on Widget {
  Widget get card  => Card(child: this);
  Widget get expanded => Expanded(child: this);
  Widget get center => Center(child: this);
  Widget sizeBox({double? height, double? width}) => SizedBox(height: height,width: width,child: this);
  Widget align({required Alignment alignment}) => Align(alignment: alignment,child: this);
  Widget paddingAll(double value) => Padding(padding:EdgeInsets.all(value) ,child: this);
  Widget paddingSymmetric({double? horizontal, double? vertical}) =>
      Padding(padding:EdgeInsets.symmetric(horizontal: horizontal ?? 0, vertical: vertical ?? 0) ,child: this);
  Widget paddingOnly({double? top,double? bottom, double? left,double? right}) =>
      Padding(padding:EdgeInsets.only(top: top ?? 0, bottom: bottom ?? 0,left: left ?? 0, right: right ?? 0) ,child: this);

}