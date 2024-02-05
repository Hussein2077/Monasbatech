import 'package:flutter/material.dart';
import 'package:monasbatek/core/resource_manager/colors.dart';
import 'package:monasbatek/core/utils/app_size.dart';

class CustomTextField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final double? width;
  final double? height;
  final int? maxLines;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool readOnly;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final void Function()? onTap;
  final TextStyle? hintStyle;

  const CustomTextField({
    Key? key,
    this.labelText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.readOnly = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    this.hintText,
    this.hintStyle,
    this.width,
    this.height,
    this.maxLines,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? AppSize.defaultSize! * 7,
      width: widget.width ?? AppSize.screenWidth! - (AppSize.defaultSize! * 4),
      child: TextFormField(
        onTap: widget.onTap,

        readOnly: widget.readOnly,
        style: TextStyle(
            color: AppColors.pink,
            fontWeight: FontWeight.w700,
            fontSize: AppSize.defaultSize! * 1.4),
        decoration: InputDecoration(
          labelText: widget.labelText,
          filled: true,
          fillColor: Colors.white.withOpacity(.5),
          hintText: widget.hintText,
          hintStyle: widget.hintStyle ??
              TextStyle(
                  color: AppColors.secondaryBackGroundColor,
                  fontSize: AppSize.defaultSize! * 1.4),
          suffixIcon: widget.suffixIcon,
          labelStyle: TextStyle(
            color: AppColors.primaryColor,
            fontSize: AppSize.screenHeight! * .02,
          ),
          prefixIcon: widget.prefixIcon,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(AppSize.defaultSize! * 2)),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.blackColor),
              borderRadius: BorderRadius.circular(AppSize.defaultSize! * 2)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(AppSize.defaultSize! * 2)),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(AppSize.defaultSize! * 2)),
        ),
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
      ),
    );
  }
}
