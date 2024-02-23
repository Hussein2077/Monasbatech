import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monasbatek/core/widgets/main_button.dart';

import '../../../../core/resource_manager/asset_path.dart';
import '../../../../core/resource_manager/colors.dart';
import '../../../../core/resource_manager/string_manager.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/widgets/cutom_text.dart';

class OrderStatusDetails extends StatelessWidget {
  const OrderStatusDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          StringManager.orderDetails.tr(),
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
        padding: EdgeInsets.all(AppSize.defaultSize! * 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: StringManager.address.tr(),
                  fontWeight: FontWeight.w500,
                  fontSize: AppSize.defaultSize! * 1.8,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppSize.defaultSize! * 1),
                      color: AppColors.white),
                  padding: EdgeInsets.all(AppSize.defaultSize! * 0.8),
                  child: CustomText(
                    text: StringManager.complete.tr(),
                    color: AppColors.orderCompletedStatus,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: AppSize.screenHeight! * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: CircleAvatar(
                    backgroundColor: AppColors.white,
                    child: SvgPicture.asset(
                      AssetPath.location,
                      height: AppSize.screenHeight! * 0.04,
                      width: AppSize.screenWidth! * 0.04,
                    ),
                  ),
                ),
                SizedBox(
                  width: AppSize.screenWidth! * 0.01,
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
                      color: AppColors.greyColor,
                    ),
                    CustomText(
                      text: StringManager.jeddahName.tr(),
                      fontWeight: FontWeight.w400,
                      fontSize: AppSize.defaultSize! * 1.3,
                      color: AppColors.greyColor,
                    ),
                    CustomText(
                      text: StringManager.phoneNumber.tr(),
                      fontWeight: FontWeight.w400,
                      fontSize: AppSize.defaultSize! * 1.3,
                      color: AppColors.greyColor,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: AppSize.screenHeight! * 0.01,
            ),
            CustomText(
              text: StringManager.product.tr(),
              color: AppColors.black,
              fontSize: AppSize.defaultSize! * 2,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: AppSize.screenHeight! * 0.01,
            ),
            Container(
              padding: EdgeInsets.all(AppSize.defaultSize! * 0.8),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(AppSize.defaultSize! * 1.5),
                  color: AppColors.white),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: AppSize.screenHeight! * 0.1,
                          child: Image.asset(AssetPath.productImg),
                        ),
                        SizedBox(
                          width: AppSize.defaultSize! * 0.5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: StringManager.productName.tr(),
                              color: AppColors.primaryColor,
                              fontSize: AppSize.defaultSize! * 2,
                              fontWeight: FontWeight.w500,
                            ),
                            Row(
                              children: [
                                Container(
                                  child: Image.asset(AssetPath.companyImg),
                                ),
                                SizedBox(
                                  width: AppSize.screenWidth! * 0.01,
                                ),
                                CustomText(
                                  text: StringManager.companyName.tr(),
                                  color: AppColors.greyColor,
                                ),
                              ],
                            ),
                            CustomText(
                              text: StringManager.productPrice.tr(),
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        )
                      ],
                    ),
                    CircleAvatar(
                        minRadius: AppSize.defaultSize! * 1.5,
                        child: Center(
                          child: Text(
                            "4x",
                            style: TextStyle(color: AppColors.backGroundColor),
                          ),
                        ),
                        backgroundColor: AppColors.primaryColor),
                  ],
                ),
              ),
            ),
            //----------
            SizedBox(
              height: AppSize.screenHeight! * 0.01,
            ),
            Container(
              padding: EdgeInsets.all(AppSize.defaultSize! * 1.5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.defaultSize! * 1.5),
                color: AppColors.white,
              ),
              child: Center(
                child: Row(
                  children: [
                    Container(
                      child: SvgPicture.asset(AssetPath.masterCardIcon),
                    ),
                    SizedBox(
                      width: AppSize.screenWidth! * 0.02,
                    ),
                    CustomText(
                      text: StringManager.masterCardData.tr(),
                      color: AppColors.greyColor,
                    ),
                  ],
                ),
              ),
            ),
            //--------
            SizedBox(
              height: AppSize.screenHeight! * 0.01,
            ),
            Container(
              padding: EdgeInsets.all(AppSize.defaultSize! * 1.5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.defaultSize! * 1.5),
                color: AppColors.white,
              ),
              child: Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: StringManager.partialTotal.tr()),
                        const CustomText(text: "102 SAR"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: StringManager.deliveryCost.tr()),
                        const CustomText(text: "10 SAR"),
                      ],
                    ),
                    const Divider(
                      endIndent: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: StringManager.total.tr(),
                          fontWeight: FontWeight.w600,
                        ),
                        CustomText(
                          text: "112 SAR",
                          color: AppColors.primaryColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            //--------
            SizedBox(
              height: AppSize.screenHeight! * 0.05,
            ),
            MainButton(
              text: StringManager.orderAgain.tr(),
            )
          ],
        ),
      ),
    );
  }
}
