import 'package:employees/resources/colors_manager.dart';
import 'package:flutter/material.dart';

class CustomDropdownButtonFormField extends StatelessWidget {
  final Object? currentValue;
  final bool autofocus;
  final TextStyle? style;
  final Color? textColor;
  final List<String> valuesText;
  final List<Object> valuesObject;
  final void Function(Object?)? onChanged;
  final String? Function(Object?)? validator;
  final Function(Object?)? onSaved;
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
  final double prefixPadding;

  const CustomDropdownButtonFormField({
    Key? key,
    this.currentValue,
    this.autofocus = false,
    this.style,
    this.textColor,
    required this.valuesText,
    required this.valuesObject,
    required this.onChanged,
    this.validator,
    this.onSaved,
    this.borderRadius = 10,
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
    this.labelColor = ColorsManager.white,
    this.labelFontWeight,
    this.prefixIcon,
    this.prefixPadding = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: DropdownButtonFormField(
        dropdownColor: ColorsManager.color1,
        value: currentValue,
        onChanged: onChanged,
        autofocus: autofocus,
        style: style ?? Theme.of(context).textTheme.bodySmall!.copyWith(color: textColor ?? ColorsManager.color4, fontWeight: FontWeight.w500),
        validator: validator,
        onSaved: onSaved,
        iconEnabledColor: ColorsManager.color4,
        items: List.generate(valuesText.length, (index) => DropdownMenuItem(
          value: valuesObject[index],
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(valuesText[index]),
          ),
        )),
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius), borderSide: BorderSide(color: borderColor ?? (ColorsManager.color1), width: 1)),
          disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius), borderSide: BorderSide(color: borderColor ?? (ColorsManager.color1), width: 1)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius), borderSide: BorderSide(color: borderColor ?? (ColorsManager.color1), width: 1)),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius), borderSide: BorderSide(color: borderColor ?? (ColorsManager.color1), width: 1)),
          errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius), borderSide: BorderSide(color: errorBorderColor, width: 1)),
          focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius), borderSide: BorderSide(color: errorBorderColor, width: 1)),
          contentPadding: contentPadding ?? EdgeInsets.symmetric(horizontal: 20, vertical: verticalPadding),
          filled: true,
          fillColor: fillColor ?? (ColorsManager.color1),
          hintText: hintText,
          labelText: labelText,
          hintStyle: hintStyle ?? Theme.of(context).textTheme.titleSmall!.copyWith(color: hintColor),
          labelStyle: labelStyle ?? Theme.of(context).textTheme.titleSmall!.copyWith(color: labelColor, fontWeight: labelFontWeight),
          errorStyle: errorStyle ?? Theme.of(context).textTheme.titleSmall!.copyWith(color: ColorsManager.red700, height: errorHeight),
          prefixIcon: prefixIcon != null ? Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 10, 0),
            child: prefixIcon,
          ) : null,
          prefix: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(prefixPadding, 0, 0, 0),
          ),
        ),
      ),
    );
  }
}