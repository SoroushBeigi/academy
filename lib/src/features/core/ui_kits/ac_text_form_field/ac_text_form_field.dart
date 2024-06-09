import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/resources/resources.dart';

class ACTextFormField extends StatelessWidget {
  const ACTextFormField({
    super.key,
    required this.controller,
    this.focusNode,
    this.isPasswordField = false,
    this.autocorrect = false,
    this.textInputType = TextInputType.name,
    this.textInputAction,
    this.inputFormatters,
    this.readOnly = false,
    required this.hintText,
    this.suffixIcon,
    this.borderColor,
    this.hintStyle,
    this.style,
    this.maxLines,
  });
  final TextEditingController controller;
  final FocusNode? focusNode;
  final bool? isPasswordField;
  final bool? autocorrect;
  final Color? borderColor;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final bool? readOnly;
  final String hintText;
  final Widget? suffixIcon;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      obscureText: isPasswordField ?? false,
      autocorrect: autocorrect ?? false,
      onTapOutside: (event) {FocusScope.of(context).unfocus();},
      readOnly: readOnly ?? false,
      keyboardType: textInputType ?? ((isPasswordField ?? false) ? TextInputType.visiblePassword : null),
      textInputAction: textInputAction,
      inputFormatters: inputFormatters,
      maxLines: maxLines ?? 1,
      style: style ?? Theme.of(context).textTheme.displayMedium,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle ?? Theme.of(context).textTheme.bodyMedium,
        suffixIcon: suffixIcon,
        labelText: hintText,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: borderColor ?? Theme.of(context).colorScheme.onSecondary,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s12))
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: borderColor ?? Theme.of(context).colorScheme.onSecondary,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s12))
        ),
      ),
    );
  }
}