import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/resource_manager/asset_path.dart';
import '../../../../core/resource_manager/colors.dart';
import '../../../../core/resource_manager/string_manager.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/widgets/cutom_text.dart';

class ProfileButtonWidget extends StatelessWidget {
  const ProfileButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSize.defaultSize! * 2.5),
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
                      AssetPath.profileNavigation,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: AppSize.screenWidth! * 0.015,
                  ),
                  Container(
                    height: AppSize.screenHeight! * 0.03,
                    width: AppSize.screenWidth! * 0.005,
                    color: AppColors.greyColor.withOpacity(0.5),
                  ),
                  SizedBox(
                    width: AppSize.screenWidth! * 0.015,
                  ),
                  CustomText(
                    text: StringManager.editPersonalProfile.tr(),
                    fontSize: AppSize.defaultSize! * 1.9,
                  ),
                ],
              ),
              Container(
                child: SvgPicture.asset(
                  AssetPath.arrowRight,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
