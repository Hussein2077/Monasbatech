import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monasbatek/core/resource_manager/asset_path.dart';
import 'package:monasbatek/core/resource_manager/colors.dart';
import 'package:monasbatek/core/widgets/cutom_text.dart';

import '../../../../core/resource_manager/string_manager.dart';
import '../../../../core/utils/app_size.dart';

class EditProfileData extends StatelessWidget {
  final String title;
  final String prefixIcon;
  EditProfileData({
    super.key,
    required this.title,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(AppSize.defaultSize! * 1.5),
      ),
      width: AppSize.screenWidth,
      child: Padding(
        padding: EdgeInsets.all(AppSize.defaultSize! * 1.5),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    child: SvgPicture.asset(
                      prefixIcon,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  SizedBox(
                    width: AppSize.screenWidth! * 0.025,
                  ),
                  CustomText(
                    text: title,
                    fontSize: AppSize.defaultSize! * 1.9,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
