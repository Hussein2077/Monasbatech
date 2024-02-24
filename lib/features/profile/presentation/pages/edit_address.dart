import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monasbatek/core/widgets/custom_text_field.dart';
import 'package:monasbatek/core/widgets/cutom_text.dart';
import 'package:monasbatek/core/widgets/main_button.dart';

import '../../../../core/resource_manager/asset_path.dart';
import '../../../../core/resource_manager/colors.dart';
import '../../../../core/resource_manager/string_manager.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/widgets/phone_with_country.dart';

class EditAddress extends StatelessWidget {
  const EditAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          StringManager.editAddress.tr(),
          style: TextStyle(fontSize: AppSize.defaultSize! * 2.5),
        ),
        backgroundColor: AppColors.backGroundColor,
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: Container(
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
        padding: EdgeInsets.all(AppSize.defaultSize! * 1.5),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: StringManager.deliveryTo.tr(),
                fontSize: AppSize.defaultSize! * 1.9,
                fontWeight: FontWeight.w500,
              ).animate().fade().scale(),
              SizedBox(
                height: AppSize.screenHeight! * 0.01,
              ),
              //----------------------
              Container(
                width: AppSize.screenWidth,
                padding: EdgeInsets.all(AppSize.defaultSize! * 0.5),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(AppSize.defaultSize! * 1.5),
                  color: AppColors.white,
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                      icon: SvgPicture.asset(AssetPath.arrowDown),
                      isExpanded: true,
                      items: [
                        DropdownMenuItem(
                          child: CustomText(
                            text: StringManager.home,
                            fontSize: AppSize.defaultSize! * 1.6,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                      onChanged: (value) {}),
                ),
              ).animate().fade().scale(),
              SizedBox(
                height: AppSize.screenHeight! * 0.01,
              ),
              //----------------------
              CustomText(
                text: StringManager.phoneNum.tr(),
                fontSize: AppSize.defaultSize! * 1.9,
                fontWeight: FontWeight.w500,
              ).animate().fade().scale(),
              SizedBox(
                height: AppSize.screenHeight! * 0.01,
              ),
              //----------------------
              PhoneWithCountry().animate().fade().scale(),
              SizedBox(
                height: AppSize.screenHeight! * 0.01,
              ),
              //----------------------
              CustomText(
                text: StringManager.city.tr(),
                fontSize: AppSize.defaultSize! * 1.9,
                fontWeight: FontWeight.w500,
              ).animate().fade().scale(),
              SizedBox(
                height: AppSize.screenHeight! * 0.01,
              ),
              //----------------------
              Container(
                width: AppSize.screenWidth,
                padding: EdgeInsets.all(AppSize.defaultSize! * 0.5),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(AppSize.defaultSize! * 1.5),
                  color: AppColors.white,
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                      icon: SvgPicture.asset(AssetPath.arrowDown),
                      isExpanded: true,
                      items: [
                        DropdownMenuItem(
                          child: CustomText(
                            text: StringManager.jeddahName,
                            fontSize: AppSize.defaultSize! * 1.6,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                      onChanged: (value) {}),
                ),
              ).animate().fade().scale(),
              SizedBox(
                height: AppSize.screenHeight! * 0.01,
              ),
              //-------------
              CustomText(
                text: StringManager.addressInDetail.tr(),
                fontSize: AppSize.defaultSize! * 1.9,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: AppSize.screenHeight! * 0.01,
              ).animate().fade().scale(),
              //----------------------
              CustomTextField(
                minLines: 5,
              ),
              SizedBox(
                height: AppSize.screenHeight! * 0.05,
              ),
              //----------------------
              MainButton(text: StringManager.edit.tr())
                  .animate()
                  .fade()
                  .scale(),
            ],
          ),
        ),
      ),
    );
  }
}
