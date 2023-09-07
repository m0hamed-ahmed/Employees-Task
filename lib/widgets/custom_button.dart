import 'package:employees/resources/colors_manager.dart';
import 'package:flutter/material.dart';

enum ButtonType {text, icon, image, preIcon, postIcon, preSpacerIcon, postSpacerIcon, preImage, postImage, preSpacerImage, postSpacerImage, postSpacerText, preIconPostSpacerText}

class CustomButton extends StatelessWidget {
  final ButtonType buttonType;
  final Function()? onPressed;
  final double? width;
  final double? height;
  final Color buttonColor;
  final Color borderColor;
  final double borderRadius;
  final BorderRadiusGeometry? radius;
  final double borderWidth;
  final double elevation;
  final bool isCircleBorder;
  final String text;
  final TextStyle? textStyle;
  final Color textColor;
  final double fontSize;
  final FontWeight? textFontWeight;
  final IconData? iconData;
  final Color iconColor;
  final double iconSize;
  final String? imageName;
  final Color? imageColor;
  final double imageSize;
  final String spacerText;
  final TextStyle? spacerTextStyle;
  final bool isLoading;
  final EdgeInsetsGeometry? padding;

  const CustomButton({
    Key? key,
    required this.buttonType,
    this.onPressed,
    this.width,
    this.height = 40,
    this.buttonColor = ColorsManager.green,
    this.borderColor = Colors.transparent,
    this.borderRadius = 5,
    this.radius,
    this.borderWidth = 1,
    this.elevation = 0,
    this.isCircleBorder = false,
    this.text = '',
    this.textStyle,
    this.textColor = ColorsManager.white,
    this.fontSize = 12,
    this.textFontWeight,
    this.iconData,
    this.iconColor = ColorsManager.white,
    this.iconSize = 16,
    this.imageName,
    this.imageColor,
    this.imageSize = 16,
    this.spacerText = '',
    this.spacerTextStyle,
    this.isLoading = false,
    this.padding
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(isLoading) {
      return const SizedBox(
        height: 50,
        child: Center(
          child: SizedBox(
            width: 30,
            height: 30,
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }
    return MaterialButton(
      padding: padding,
      onPressed: onPressed ?? () {},
      minWidth: width,
      height: height,
      color: buttonColor,
      elevation: elevation,
      hoverElevation: elevation,
      focusElevation: elevation,
      highlightElevation: elevation,
      shape: isCircleBorder ? const CircleBorder() : RoundedRectangleBorder(
        borderRadius: radius != null ? radius! : BorderRadius.circular(borderRadius),
        side: BorderSide(color: borderColor, width: borderWidth),
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      child: _getButton(context),
    );
  }

  Widget _getButton(BuildContext context) {
    switch (buttonType) {
      case ButtonType.text: return _textButton(context);
      case ButtonType.icon: return _iconButton(context);
      case ButtonType.image: return _imageButton(context);
      case ButtonType.preIcon: return _preIconButton(context);
      case ButtonType.postIcon: return _postIconButton(context);
      case ButtonType.preSpacerIcon: return _preSpacerIconButton(context);
      case ButtonType.postSpacerIcon: return _postSpacerIconButton(context);
      case ButtonType.preImage: return _preImageButton(context);
      case ButtonType.postImage: return _postImageButton(context);
      case ButtonType.preSpacerImage: return _preSpacerImageButton(context);
      case ButtonType.postSpacerImage: return _postSpacerImageButton(context);
      case ButtonType.postSpacerText: return _postSpacerTextButton(context);
      case ButtonType.preIconPostSpacerText: return _preIconPostSpacerTextButton(context);
      default: return Container();
    }
  }

  Widget _textButton(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: textStyle ?? Theme.of(context).textTheme.displayMedium!.copyWith(color: textColor, fontSize: fontSize, fontWeight: textFontWeight),
    );
  }

  Widget _iconButton(BuildContext context) {
    return Icon(iconData, color: iconColor, size: iconSize);
  }

  Widget _imageButton(BuildContext context) {
    return Image.asset(imageName!, color: imageColor, width: imageSize, height: imageSize);
  }

  Widget _preIconButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(iconData, color: iconColor, size: iconSize),
        const SizedBox(width: 10),
        Flexible(
          child: FittedBox(
            child: Text(
              text,
              style: textStyle ?? Theme.of(context).textTheme.displayLarge!.copyWith(color: textColor, fontSize: fontSize, fontWeight: textFontWeight),
            ),
          ),
        ),
      ],
    );
  }

  Widget _postIconButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: FittedBox(
            child: Text(
              text,
              style: textStyle ?? Theme.of(context).textTheme.displayLarge!.copyWith(color: textColor, fontSize: fontSize, fontWeight: textFontWeight),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Icon(iconData, color: iconColor, size: iconSize),
      ],
    );
  }

  Widget _preSpacerIconButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(iconData, color: iconColor, size: iconSize),
        const SizedBox(width: 10),
        Flexible(
          child: FittedBox(
            child: Text(
              text,
              style: textStyle ?? Theme.of(context).textTheme.displayLarge!.copyWith(color: textColor, fontSize: fontSize, fontWeight: textFontWeight),
            ),
          ),
        ),
      ],
    );
  }

  Widget _postSpacerIconButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: FittedBox(
            child: Text(
              text,
              style: textStyle ?? Theme.of(context).textTheme.displayLarge!.copyWith(color: textColor, fontSize: fontSize, fontWeight: textFontWeight),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Icon(iconData, color: iconColor, size: iconSize),
      ],
    );
  }

  Widget _preImageButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(imageName!, color: imageColor, width: imageSize, height: imageSize),
        const SizedBox(width: 10),
        Flexible(
          child: FittedBox(
            child: Text(
              text,
              style: textStyle ?? Theme.of(context).textTheme.displayLarge!.copyWith(color: textColor, fontSize: fontSize, fontWeight: textFontWeight),
            ),
          ),
        ),
      ],
    );
  }

  Widget _postImageButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: FittedBox(
            child: Text(
              text,
              style: textStyle ?? Theme.of(context).textTheme.displayLarge!.copyWith(color: textColor, fontSize: fontSize, fontWeight: textFontWeight),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Image.asset(imageName!, color: imageColor, width: imageSize, height: imageSize),
      ],
    );
  }

  Widget _preSpacerImageButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(imageName!, color: imageColor, width: imageSize, height: imageSize),
        const SizedBox(width: 10),
        Flexible(
          child: FittedBox(
            child: Text(
              text,
              style: textStyle ?? Theme.of(context).textTheme.displayLarge!.copyWith(color: textColor, fontSize: fontSize, fontWeight: textFontWeight),
            ),
          ),
        ),
      ],
    );
  }

  Widget _postSpacerImageButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: FittedBox(
            child: Text(
              text,
              style: textStyle ?? Theme.of(context).textTheme.displayLarge!.copyWith(color: textColor, fontSize: fontSize, fontWeight: textFontWeight),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Image.asset(imageName!, color: imageColor, width: imageSize, height: imageSize),
      ],
    );
  }

  Widget _postSpacerTextButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: FittedBox(
            child: Text(
              text,
              style: textStyle ?? Theme.of(context).textTheme.displayLarge!.copyWith(color: textColor, fontSize: fontSize, fontWeight: textFontWeight),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Flexible(
          child: Text(
            spacerText,
            style: textStyle ?? Theme.of(context).textTheme.displayLarge!.copyWith(color: textColor, fontSize: fontSize, fontWeight: textFontWeight),
          ),
        ),
      ],
    );
  }
  
  Widget _preIconPostSpacerTextButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(iconData, color: iconColor, size: iconSize),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: textStyle ?? Theme.of(context).textTheme.displayLarge!.copyWith(color: textColor, fontSize: fontSize, fontWeight: textFontWeight),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          spacerText,
          style: spacerTextStyle,
        ),
      ],
    );
  }
}