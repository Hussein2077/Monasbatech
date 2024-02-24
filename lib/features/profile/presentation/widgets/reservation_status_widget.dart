import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monasbatek/core/resource_manager/string_manager.dart';

import '../../../../core/resource_manager/asset_path.dart';
import '../../../../core/resource_manager/colors.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/widgets/cutom_text.dart';

class ReservationStatusWidget extends StatelessWidget {
  final String reservationCompanyImg;
  final String reservationCompanyTitle;
  final String reservationDate;
  final String reservationAddress;
  final String reservationStatus;
  ReservationStatusWidget(
      {super.key,
      required this.reservationCompanyImg,
      required this.reservationCompanyTitle,
      required this.reservationDate,
      required this.reservationAddress,
      required this.reservationStatus});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppSize.defaultSize! * 1),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    child: Image.asset(reservationCompanyImg),
                  ),
                  SizedBox(
                    width: AppSize.screenWidth! * 0.01,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: reservationCompanyTitle,
                        fontWeight: FontWeight.w600,
                      ),
                      Row(
                        children: [
                          Container(
                            child: SvgPicture.asset(AssetPath.calendar),
                          ),
                          SizedBox(
                            width: AppSize.screenWidth! * 0.01,
                          ),
                          CustomText(
                            text: reservationDate,
                            color: AppColors.pink,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            child: SvgPicture.asset(
                              AssetPath.location,
                              color: AppColors.pink,
                            ),
                          ),
                          SizedBox(
                            width: AppSize.screenWidth! * 0.01,
                          ),
                          CustomText(
                            text: reservationAddress,
                            color: AppColors.pink,
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  reservationStatus == "null"
                      ? SizedBox()
                      : Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  AppSize.defaultSize! * 1),
                              color: AppColors.primaryColor),
                          padding: EdgeInsets.all(AppSize.defaultSize! * 0.7),
                          child: CustomText(
                            text: reservationStatus,
                            color: AppColors.white,
                            fontSize: AppSize.defaultSize! * 1,
                          ),
                        ),
                  SizedBox(
                    height: AppSize.screenHeight! * 0.01,
                  ),
                  CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    minRadius: AppSize.defaultSize! * 1.2,
                    child: SvgPicture.asset(AssetPath.arrowRight),
                  ),
                ],
              ),
            ],
          ),
          Divider(
            color: AppColors.greyColor.withOpacity(0.2),
          ),
        ],
      ),
    );
  }
}
