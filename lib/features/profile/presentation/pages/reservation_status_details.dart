import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monasbatek/core/widgets/cutom_text.dart';
import 'package:monasbatek/core/widgets/main_button.dart';

import '../../../../core/resource_manager/asset_path.dart';
import '../../../../core/resource_manager/colors.dart';
import '../../../../core/resource_manager/string_manager.dart';
import '../../../../core/utils/app_size.dart';

class ReservationStatusDetails extends StatelessWidget {
  final String reservationStatusTitle;
  ReservationStatusDetails({super.key, required this.reservationStatusTitle});

  Color chooseReservationStatusColor() {
    if (reservationStatusTitle == StringManager.completeReservation.tr()) {
      return AppColors.orderCompletedStatus;
    } else if (reservationStatusTitle ==
        StringManager.progressReservationTitle.tr()) {
      return AppColors.progressReservationColor;
    } else {
      return AppColors.orderCanceledStatus;
    }
  }

  Widget ReservationStatusContainerWidget({
    required String reservationStatusTitle,
  }) {
    return Container(
      height: AppSize.screenHeight! * 0.055,
      width: AppSize.screenWidth!,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.defaultSize! * 1.5),
        color: chooseReservationStatusColor(),
      ),
      child: Center(
        child: CustomText(
          text: reservationStatusTitle,
          color: AppColors.white,
          fontSize: AppSize.defaultSize! * 1.7,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget chooseButtonOrderByReservationStatus() {
    if (reservationStatusTitle == StringManager.completeReservation.tr()) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: AppSize.screenHeight! * 0.06,
            width: AppSize.screenWidth! * 0.45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.defaultSize! * 1.5),
                color: AppColors.primaryColor),
            child: Center(
              child: CustomText(
                text: StringManager.orderAgain.tr(),
                color: AppColors.white,
                fontSize: AppSize.defaultSize! * 1.7,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            width: AppSize.screenWidth! * 0.45,
            height: AppSize.screenHeight! * 0.06,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.defaultSize! * 1.5),
                border: Border.all(color: AppColors.ratingColor)),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: SvgPicture.asset(
                      AssetPath.star,
                      color: AppColors.ratingColor,
                      height: AppSize.screenHeight! * 0.03,
                    ),
                  ),
                  CustomText(
                    text: StringManager.ratingUs.tr(),
                    color: AppColors.ratingColor,
                    fontSize: AppSize.defaultSize! * 1.7,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
          )
        ],
      );
    } else if (reservationStatusTitle ==
        StringManager.reservationCanceled.tr()) {
      return MainButton(text: StringManager.orderAgain.tr());
    } else {
      return SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          StringManager.reservationDetails.tr(),
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
          children: [
            Center(
              child: Container(
                height: AppSize.screenHeight! * 0.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.defaultSize! * 2),
                  color: AppColors.white,
                ),
                child: Image.asset(AssetPath.qrCode),
              ),
            ),
            SizedBox(
              height: AppSize.screenHeight! * 0.01,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.white,
                    child: SvgPicture.asset(AssetPath.share),
                  ),
                  SizedBox(
                    width: AppSize.screenWidth! * 0.01,
                  ),
                  CustomText(
                    text: StringManager.inviteQrCode.tr(),
                    fontSize: AppSize.defaultSize! * 1.5,
                    fontWeight: FontWeight.w600,
                    color: AppColors.pink,
                  ),
                ],
              ),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      child: Image.asset(AssetPath.profileCompanyImg),
                    ),
                    SizedBox(
                      width: AppSize.defaultSize! * 0.5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          StringManager.trendCafe.tr(),
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: AppSize.defaultSize! * 1.6,
                            fontWeight: FontWeight.w700,
                            height: 0.08,
                          ),
                        ),
                        SizedBox(
                          height: AppSize.defaultSize! * 2,
                        ),
                        Row(
                          children: [
                            Container(
                              child: SvgPicture.asset(
                                AssetPath.location,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            Text(
                              StringManager.homeAddress.tr(),
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: AppSize.defaultSize! * 1.5,
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: SvgPicture.asset(
                      AssetPath.profileChatIcon,
                    ),
                  ),
                ),
              ],
            ),

            //------------------
            SizedBox(
              height: AppSize.screenHeight! * 0.01,
            ),
            Container(
              height: AppSize.screenHeight! * 0.055,
              width: AppSize.screenWidth!,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.defaultSize! * 1.5),
                color: AppColors.pink,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: SvgPicture.asset(
                      AssetPath.calendar,
                      color: AppColors.white,
                      height: AppSize.screenHeight! * 0.03,
                    ),
                  ),
                  SizedBox(
                    width: AppSize.defaultSize! * 0.5,
                  ),
                  CustomText(
                    text: StringManager.reservationDateByDay.tr(),
                    color: AppColors.white,
                    fontSize: AppSize.defaultSize! * 1.7,
                  ),
                  SizedBox(
                    width: AppSize.defaultSize! * 1.5,
                  ),
                  Container(
                    child: SvgPicture.asset(
                      AssetPath.time,
                      height: AppSize.screenHeight! * 0.03,
                    ),
                  ),
                  SizedBox(
                    width: AppSize.defaultSize! * 0.5,
                  ),
                  CustomText(
                    text: StringManager.reservationTime.tr(),
                    color: AppColors.white,
                    fontSize: AppSize.defaultSize! * 1.7,
                  ),
                ],
              ),
            ),
            //------------------
            SizedBox(
              height: AppSize.screenHeight! * 0.02,
            ),
            ReservationStatusContainerWidget(
              reservationStatusTitle: reservationStatusTitle,
            ),
            //------------------
            SizedBox(
              height: AppSize.screenHeight! * 0.02,
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
            //------------------
            SizedBox(
              height: AppSize.screenHeight! * 0.02,
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
                        CustomText(text: StringManager.chocolateCost.tr()),
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
            //---------
            SizedBox(
              height: AppSize.screenHeight! * 0.035,
            ),
            chooseButtonOrderByReservationStatus(),
          ],
        ),
      ),
    );
  }
}
