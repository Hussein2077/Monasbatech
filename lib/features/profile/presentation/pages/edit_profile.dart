import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monasbatek/core/resource_manager/colors.dart';
import 'package:monasbatek/core/widgets/cutom_text.dart';
import 'package:monasbatek/core/widgets/main_button.dart';

import '../../../../core/resource_manager/asset_path.dart';
import '../../../../core/resource_manager/string_manager.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/phone_with_country.dart';
import '../widgets/edit_photo_widget.dart';
import '../widgets/edit_profile_data.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          StringManager.editPersonalProfile.tr(),
          style: TextStyle(fontSize: AppSize.defaultSize! * 2.5),
        ),
        backgroundColor: AppColors.backGroundColor,
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: AppSize.screenHeight! * 0.5,
              width: AppSize.screenWidth! * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(
                  AssetPath.arrowLeft,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSize.defaultSize! * 1),
        child: Stack(
          children: [
            Column(
              children: [
                EditPhotoWidget().animate().fade().scale(),
                SizedBox(
                  height: AppSize.screenHeight! * 0.07,
                ),
                Row(
                  children: [
                    CustomText(
                      text: StringManager.fullName.tr(),
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ).animate().fade().scale(),
                SizedBox(
                  height: AppSize.screenHeight! * 0.01,
                ),
                EditProfileData(
                  title: StringManager.profileName.tr(),
                  prefixIcon: AssetPath.profileNavigation,
                ).animate().fade().scale(),
                SizedBox(
                  height: AppSize.screenHeight! * 0.01,
                ),
                Row(
                  children: [
                    CustomText(
                      text: StringManager.email.tr(),
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ).animate().fade().scale(),
                SizedBox(
                  height: AppSize.screenHeight! * 0.01,
                ),
                EditProfileData(
                  title: StringManager.emailAddress.tr(),
                  prefixIcon: AssetPath.emailIcon,
                ).animate().fade().scale(),
                SizedBox(
                  height: AppSize.screenHeight! * 0.01,
                ),
                Row(
                  children: [
                    CustomText(
                      text: StringManager.phoneNum.tr(),
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ).animate().fade().scale(),
                SizedBox(
                  height: AppSize.screenHeight! * 0.01,
                ),
                PhoneWithCountry().animate().fade().scale(),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: MainButton(
                text: StringManager.edit.tr(),
              ),
            ).animate().fade().scale()
          ],
        ),
      ),
    );
  }
}
