import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

extension DoubleExtension on double {
  Widget heightSizeBox() => SizedBox(height: this);
  Widget widthSizeBox() => SizedBox(width: this);
}

extension IconDataExtension on IconData {
  Widget iconWidget({Color? color,double? size}) => IconWidget(iconData: this, color: color, size: size,);
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