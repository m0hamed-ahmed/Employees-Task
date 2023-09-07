import 'package:employees/resources/colors_manager.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final bool? enabled;
  final TextEditingController? controller;
  final TextDirection textDirection;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final Color? cursorColor;
  final bool autofocus;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;
  final bool obscureText;
  final TextStyle? style;
  final TextAlign textAlign;
  final Color? textColor;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final double borderRadius;
  final Color? borderColor;
  final Color errorBorderColor;
  final String? labelText;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextStyle? errorStyle;
  final double? errorHeight;
  final EdgeInsetsGeometry? contentPadding;
  final double verticalPadding;
  final Color? fillColor;
  final Color? hintColor;
  final Color? labelColor;
  final FontWeight? labelFontWeight;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? suffixIconPadding;
  final double prefixPadding;
  final bool expands;
  final TextAlignVertical? textAlignVertical;

  const CustomTextFormField({
    Key? key,
    this.enabled = true,
    this.controller,
    this.textDirection = TextDirection.ltr,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.cursorColor,
    this.autofocus = false,
    this.maxLength,
    this.minLines,
    this.maxLines,
    this.obscureText = false,
    this.style,
    this.textAlign = TextAlign.start,
    this.textColor,
    this.onChanged,
    this.validator,
    this.onSaved,
    this.borderRadius = 5,
    this.borderColor,
    this.errorBorderColor = ColorsManager.red,
    this.labelText,
    this.hintText,
    this.hintStyle,
    this.labelStyle,
    this.errorStyle,
    this.errorHeight,
    this.contentPadding,
    this.verticalPadding = 0,
    this.fillColor,
    this.hintColor = ColorsManager.grey,
    this.labelColor = ColorsManager.blue,
    this.labelFontWeight,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixIconPadding,
    this.prefixPadding = 10,
    this.expands = false,
    this.textAlignVertical,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlignVertical: textAlignVertical,
      expands: expands,
      enabled: enabled,
      controller: controller,
      textDirection: textDirection,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      cursorColor: cursorColor ?? (ColorsManager.white),
      autofocus: autofocus,
      maxLength: maxLength,
      minLines: minLines,
      maxLines: maxLines,
      obscureText: obscureText ? true : false,
      style: style ?? Theme.of(context).textTheme.titleMedium!.copyWith(color: textColor ?? (ColorsManager.white), fontWeight: FontWeight.w500),
      textAlign: textAlign,
      onChanged: onChanged,
      validator: validator,
      onSaved: onSaved,
      onTap: controller == null ? null : () {
        if(controller!.selection == TextSelection.fromPosition(TextPosition(offset: controller!.text.length -1))) {
          controller!.selection = TextSelection.fromPosition(TextPosition(offset: controller!.text.length));
        }
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius), borderSide: BorderSide(color: borderColor ?? (ColorsManager.lightSecondaryColor), width: 1)),
        disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius), borderSide: BorderSide(color: borderColor ?? (ColorsManager.lightSecondaryColor), width: 1)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius), borderSide: BorderSide(color: borderColor ?? (ColorsManager.lightSecondaryColor), width: 1)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius), borderSide: BorderSide(color: borderColor ?? (ColorsManager.lightSecondaryColor), width: 1)),
        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius), borderSide: BorderSide(color: errorBorderColor, width: 1)),
        focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius), borderSide: BorderSide(color: errorBorderColor, width: 1)),
        contentPadding: contentPadding ?? (
            prefixIcon == null
                ? const EdgeInsets.all(16)
                : EdgeInsets.symmetric(horizontal: suffixIcon != null ? 0 : 10, vertical: verticalPadding)
        ),
        filled: true,
        fillColor: fillColor ?? (ColorsManager.white),
        hintText: hintText,
        labelText: labelText,
        hintStyle: hintStyle ?? Theme.of(context).textTheme.titleSmall!.copyWith(color: hintColor),
        labelStyle: labelStyle ?? Theme.of(context).textTheme.titleSmall!.copyWith(color: labelColor, fontWeight: labelFontWeight),
        errorStyle: errorStyle ?? Theme.of(context).textTheme.titleSmall!.copyWith(color: ColorsManager.red700, height: errorHeight),
        prefixIcon: prefixIcon != null ? Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 10, 0),
          child: prefixIcon,
        ) : null,
        suffixIcon: suffixIcon != null ? Padding(
          padding: suffixIconPadding ?? const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
          child: suffixIcon,
        ) : null,
        prefix: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(prefixPadding, 0, 0, 0),
        ),
      ),
    );
  }
}