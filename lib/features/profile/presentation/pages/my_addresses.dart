import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monasbatek/core/widgets/cutom_text.dart';
import 'package:monasbatek/features/profile/presentation/pages/edit_address.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../../core/resource_manager/asset_path.dart';
import '../../../../core/resource_manager/colors.dart';
import '../../../../core/resource_manager/string_manager.dart';
import '../../../../core/utils/app_size.dart';

class MyAddresses extends StatelessWidget {
  const MyAddresses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          StringManager.myAddresses.tr(),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: StringManager.address.tr(),
              fontSize: AppSize.defaultSize! * 1.9,
              fontWeight: FontWeight.w500,
            ).animate().fade().scale(),
            SizedBox(
              height: AppSize.screenHeight! * 0.01,
            ),
            //----------------------
            Container(
              padding: EdgeInsets.all(AppSize.defaultSize! * 1),
              width: AppSize.screenWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.defaultSize! * 1.5),
                border: Border.all(color: AppColors.primaryColor),
                color: AppColors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.primaryColor,
                        child: SvgPicture.asset(
                          AssetPath.location,
                          color: AppColors.white,
                          height: AppSize.screenHeight! * 0.03,
                        ),
                      ),
                      SizedBox(
                        width: AppSize.screenWidth! * 0.02,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: StringManager.home.tr(),
                            fontWeight: FontWeight.w500,
                            fontSize: AppSize.defaultSize! * 1.7,
                          ),
                          CustomText(
                            text: StringManager.homeAddress.tr(),
                            fontWeight: FontWeight.w400,
                            fontSize: AppSize.defaultSize! * 1.3,
                            color: AppColors.black,
                          ),
                          CustomText(
                            text: StringManager.jeddahName.tr(),
                            fontWeight: FontWeight.w400,
                            fontSize: AppSize.defaultSize! * 1.3,
                            color: AppColors.black,
                          ),
                          CustomText(
                            text: StringManager.phoneNumber.tr(),
                            fontWeight: FontWeight.w400,
                            fontSize: AppSize.defaultSize! * 1.3,
                            color: AppColors.black,
                          ),
                        ],
                      ),
                    ],
                  ).animate().fade().scale(),
                  InkWell(
                    onTap: () {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: EditAddress(),
                        withNavBar: false,
                        // OPTIONAL VALUE. True by default.
                        pageTransitionAnimation: PageTransitionAnimation.fade,
                      );
                    },
                    child: Container(
                      child: SvgPicture.asset(AssetPath.edit),
                    ),
                  )
                ],
              ),
            ).animate().fade().scale(),
            SizedBox(
              height: AppSize.screenHeight! * 0.01,
            ),
            //----------------------
            Container(
              padding: EdgeInsets.all(AppSize.defaultSize! * 1),
              width: AppSize.screenWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.defaultSize! * 1.5),
                color: AppColors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.primaryColor,
                        child: SvgPicture.asset(
                          AssetPath.location,
                          color: AppColors.white,
                          height: AppSize.screenHeight! * 0.03,
                        ),
                      ),
                      SizedBox(
                        width: AppSize.screenWidth! * 0.02,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: StringManager.home.tr(),
                            fontWeight: FontWeight.w500,
                            fontSize: AppSize.defaultSize! * 1.7,
                          ),
                          CustomText(
                            text: StringManager.homeAddress.tr(),
                            fontWeight: FontWeight.w400,
                            fontSize: AppSize.defaultSize! * 1.3,
                            color: AppColors.black,
                          ),
                          CustomText(
                            text: StringManager.jeddahName.tr(),
                            fontWeight: FontWeight.w400,
                            fontSize: AppSize.defaultSize! * 1.3,
                            color: AppColors.black,
                          ),
                          CustomText(
                            text: StringManager.phoneNumber.tr(),
                            fontWeight: FontWeight.w400,
                            fontSize: AppSize.defaultSize! * 1.3,
                            color: AppColors.black,
                          ),
                        ],
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: EditAddress(),
                        withNavBar: false,
                        // OPTIONAL VALUE. True by default.
                        pageTransitionAnimation: PageTransitionAnimation.fade,
                      );
                    },
                    child: Container(
                      child: SvgPicture.asset(AssetPath.edit),
                    ),
                  )
                ],
              ),
            ).animate().fade().scale(),
            SizedBox(
              height: AppSize.screenHeight! * 0.04,
            ),
            //----------------------
            Center(
              child: DottedBorder(
                dashPattern: [4, 5],
                borderType: BorderType.RRect,
                radius: Radius.circular(AppSize.defaultSize! * 1.5),
                padding: EdgeInsets.all(AppSize.defaultSize! * 1),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppSize.defaultSize! * 1),
                  ),
                  child: Container(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    AppSize.defaultSize! * 1),
                                border:
                                    Border.all(color: AppColors.primaryColor)),
                            child: Icon(
                              Icons.add,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          SizedBox(
                            width: AppSize.screenWidth! * 0.02,
                          ),
                          CustomText(
                            text: StringManager.addAddress.tr(),
                            fontSize: AppSize.defaultSize! * 1.8,
                            color: AppColors.primaryColor,
                          )
                        ],
                      ),
                    ),
                    width: AppSize.screenWidth,
                    height: AppSize.screenHeight! * 0.045,
                  ),
                ),
              ),
            ).animate().fade().scale(),
          ],
        ),
      ),
    );
  }
}
