import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.controller,
    this.focusNode,
    this.textDirection,
    this.isPasswordField = false,
    this.autocorrect = false,
    this.textInputType = TextInputType.name,
    this.textInputAction,
    this.inputFormatters,
    this.readOnly = false,
    required this.hintText,
    this.suffixIcon,
  });
  final TextEditingController controller;
  final FocusNode? focusNode;
  final TextDirection? textDirection;
  final bool? isPasswordField;
  final bool? autocorrect;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final bool? readOnly;
  final String hintText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    StreamController<bool> isVisiblePassword = StreamController<bool>();
    bool passwordVisible = true;
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      textDirection: textDirection ?? TextDirection.ltr,
      obscureText: isPasswordField ?? false,
      autocorrect: autocorrect ?? false,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      readOnly: readOnly ?? false,
      keyboardType: textInputType ?? ((isPasswordField ?? false) ? TextInputType.visiblePassword : null),
      textInputAction: textInputAction,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: (isPasswordField != null && isPasswordField == true) ? GestureDetector(
          onTap: () {
            passwordVisible != passwordVisible;
            isVisiblePassword.sink.add(passwordVisible);
          },
        ) : null,

      ),
    );
  }
}
