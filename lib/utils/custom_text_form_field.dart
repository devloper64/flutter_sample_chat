import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_chat_app_with_graphql/utils/size_utils.dart';

import '../theme/custom_text_style.dart';
import '../theme/theme_helper.dart';

extension TextFormFieldStyleHelper on CustomTextFormField {
  static OutlineInputBorder get outlineBlueGrayTL5 => OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.h),
    borderSide: BorderSide(
      color: appTheme.blueGray100,
      width: 1,
    ),
  );
}

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {Key? key,
        this.alignment,
        this.width,
        this.scrollPadding,
        this.focusNode,
        this.controller,
        this.autofocus = false,
        this.textStyle,
        this.obscureText = false,
        this.textInputAction = TextInputAction.next,
        this.textInputType = TextInputType.text,
        this.maxLines,
        this.hintText,
        this.hintStyle,
        this.prefix,
        this.prefixConstraints,
        this.suffix,
        this.suffixConstraints,
        this.contentPadding,
        this.borderDecoration,
        this.fillColor,
        this.filled = false,
        this.validator,
        this.readOnly=false,
        this.onFieldSubmitted
      })
      : super(
    key: key,
  );

  final Alignment? alignment;
  final double? width;
  final TextEditingController? scrollPadding;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? autofocus;
  final TextStyle? textStyle;
  final bool? obscureText;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final int? maxLines;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefix;
  final BoxConstraints? prefixConstraints;
  final Widget? suffix;
  final BoxConstraints? suffixConstraints;
  final EdgeInsets? contentPadding;
  final InputBorder? borderDecoration;
  final Color? fillColor;
  final bool? filled;
  final FormFieldValidator<String>? validator;
  final bool readOnly;
  final Function(String)? onFieldSubmitted; // Define a parameter for the callback


  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
        alignment: alignment ?? Alignment.center,
        child: textFormFieldWidget)
        : textFormFieldWidget;
  }

  Widget get textFormFieldWidget => SizedBox(
    width: width ?? double.maxFinite,
    child: TextFormField(
      readOnly: readOnly,
      scrollPadding: EdgeInsets.only(
          bottom: MediaQuery.of(Get.context!).viewInsets.bottom),
      controller: controller,
      focusNode: focusNode,
      onTapOutside: (event) {
        if (focusNode != null) {
          focusNode?.unfocus();
        } else {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      onFieldSubmitted: onFieldSubmitted,
      autofocus: autofocus!,
      style: textStyle ?? theme.textTheme.bodyMedium,
      obscureText: obscureText!,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      maxLines: maxLines ?? 1,
      decoration: decoration,
      validator: validator,

    ),
  );

  InputDecoration get decoration => InputDecoration(
    hintText: hintText ?? "",
    hintStyle: hintStyle ?? CustomTextStyles.bodyMediumGray400,
    prefixIcon: prefix,
    prefixIconConstraints: prefixConstraints,
    suffixIcon: suffix,
    suffixIconConstraints: suffixConstraints,
    isDense: true,
    contentPadding: contentPadding ?? EdgeInsets.all(12.h),
    fillColor: fillColor,
    filled: filled,
    errorMaxLines: 3,
    border: borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.h),
          borderSide: BorderSide(
            color: appTheme.blueGray100,
            width: 1,
          ),
        ),
    enabledBorder: borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.h),
          borderSide: BorderSide(
            color: appTheme.blueGray100,
            width: 1,
          ),
        ),
    focusedBorder: borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.h),
          borderSide: BorderSide(
            color: appTheme.blueGray100,
            width: 1,
          ),
        ),
  );
}
