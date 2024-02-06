import 'package:flutter/material.dart';
import 'package:monasbatek/core/resource_manager/colors.dart';
import 'package:monasbatek/core/utils/app_size.dart';

class CustomSearchField extends StatefulWidget {
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

  const CustomSearchField({
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
  _CustomSearchFieldState createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
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
          suffixIcon: Row(
            mainAxisSize: MainAxisSize
                .min, // للتأكد من أن Row لا تشغل مساحة أكثر من اللازم
            children: [
              // زيادة المسافة بين الأيقونة والحد الداخلي لحقل النص
              widget.suffixIcon! // يمكنك استبدال هذا بأيقونتك
              ,
              SizedBox(width: AppSize.screenWidth! * 0.015),
            ],
          ),
          suffixIconConstraints: BoxConstraints(
              maxHeight: 40, maxWidth: 40, minHeight: 30, minWidth: 30),
          prefixIconConstraints: const BoxConstraints(
              maxHeight: 40, maxWidth: 40, minHeight: 30, minWidth: 30),
          labelStyle: TextStyle(
            color: AppColors.greyColor,
            fontSize: AppSize.screenHeight! * .018,
          ),
          prefixIcon: Row(
            mainAxisSize: MainAxisSize
                .min, // للتأكد من أن Row لا تشغل مساحة أكثر من اللازم
            children: [
              SizedBox(width: AppSize.screenWidth! * 0.015),
              // زيادة المسافة بين الأيقونة والحد الداخلي لحقل النص
              widget.prefixIcon! // يمكنك استبدال هذا بأيقونتك
              ,
              SizedBox(width: AppSize.screenWidth! * 0.015),
            ],
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(AppSize.defaultSize! * 2)),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.blackColor),
              borderRadius: BorderRadius.circular(AppSize.defaultSize! * 2)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(AppSize.defaultSize! * 2)),
          disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(AppSize.defaultSize! * 2)),
          contentPadding: EdgeInsets.only(
            left: AppSize.defaultSize! *
                3, // لزيادة المسافة بين الأيقونة البادئة والنص
            right: AppSize.defaultSize! *
                3, // لزيادة المسافة بين النص ونهاية حقل النص
            top: AppSize.defaultSize!, // اختياري: لضبط الفراغ العلوي
            bottom: AppSize.defaultSize!, // اختياري: لضبط الفراغ السفلي
          ),
        ),
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
      ),
    );
  }
}
