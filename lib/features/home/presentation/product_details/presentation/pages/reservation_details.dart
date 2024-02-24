import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monasbatek/core/resource_manager/asset_path.dart';
import 'package:monasbatek/core/resource_manager/colors.dart';
import 'package:monasbatek/core/utils/app_size.dart';
import 'package:monasbatek/core/widgets/cutom_text.dart';
import 'package:monasbatek/core/widgets/main_button.dart';

import '../../../../../../core/resource_manager/string_manager.dart';

class ReservationDetails extends StatelessWidget {
  const ReservationDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: AppSize.screenWidth!,
            child: Stack(
              children: [
                Image.asset(AssetPath.reservationResturant),
                Align(
                  alignment: Alignment.topRight,
                  child: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.all(AppSize.defaultSize! * 1.2),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: AppSize.screenHeight! * 0.05,
                          width: AppSize.screenWidth! * 0.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset(
                              AssetPath.arrowRightBack,
                              height: AppSize.screenHeight! * 0.09,
                              width: AppSize.screenHeight! * 0.05,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: SafeArea(
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(AppSize.defaultSize! * 1.2),
                          child: Container(
                            height: AppSize.screenHeight! * 0.05,
                            width: AppSize.screenWidth! * 0.1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SvgPicture.asset(
                                AssetPath.uploadIcon,
                                height: AppSize.screenHeight! * 0.09,
                                width: AppSize.screenHeight! * 0.05,
                                color: AppColors.black,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(AppSize.defaultSize! * 1.2),
                          child: Container(
                            height: AppSize.screenHeight! * 0.05,
                            width: AppSize.screenWidth! * 0.1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SvgPicture.asset(
                                AssetPath.heart,
                                height: AppSize.screenHeight! * 0.09,
                                width: AppSize.screenHeight! * 0.05,
                                color: AppColors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: AppSize.screenHeight! * 0.15,
                  left: AppSize.screenWidth! * 0.03,
                  child: Container(
                    height: AppSize.screenHeight! * 0.05,
                    width: AppSize.screenWidth! * 0.1,
                    child: Image.asset(AssetPath.productImg),
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: AppSize.screenHeight! * 0.55,
              width: AppSize.screenWidth!,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppSize.defaultSize! * 3.5),
                  topRight: Radius.circular(AppSize.defaultSize! * 3.5),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(AppSize.defaultSize! * 1.2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                                  StringManager.companyName.tr(),
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
                                      child:
                                          SvgPicture.asset(AssetPath.location),
                                    ),
                                    Text(
                                      StringManager.destination.tr(),
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: AppColors.greyColor,
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
                    Divider(color: AppColors.greyColor.withOpacity(0.4)),
                    //------------------
                    CustomText(
                      text: StringManager.aboutPlace.tr(),
                      fontSize: AppSize.defaultSize! * 1.8,
                      fontWeight: FontWeight.w400,
                    ),

                    Flexible(
                      child: CustomText(
                        text: StringManager.aboutPlaceDescription.tr(),
                        fontSize: AppSize.defaultSize! * 1.3,
                        overflow: TextOverflow.visible,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.justify,
                        color: AppColors.greyColor,
                      ),
                    ), //----------
                    SizedBox(
                      height: AppSize.screenHeight! * 0.01,
                    ),
                    CustomText(
                      text: StringManager.timesWork.tr(),
                      fontSize: AppSize.defaultSize! * 1.8,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(
                      height: AppSize.screenHeight! * 0.005,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: SvgPicture.asset(
                            AssetPath.time,
                            color: AppColors.black,
                          ),
                        ),
                        SizedBox(
                          width: AppSize.screenWidth! * 0.02,
                        ),
                        CustomText(
                          text: StringManager.timesWorkDate.tr(),
                          fontSize: AppSize.defaultSize! * 1.2,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppSize.screenHeight! * 0.01,
                    ),
                    //---------------------------------------
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: StringManager.testimonials.tr(),
                          fontSize: AppSize.defaultSize! * 1.8,
                          fontWeight: FontWeight.w400,
                        ),
                        CustomText(
                          text: StringManager.viewAll.tr(),
                          fontSize: AppSize.defaultSize! * 1.5,
                          fontWeight: FontWeight.w500,
                          color: AppColors.pink,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppSize.screenHeight! * 0.01,
                    ),
                    //----------------------------------------
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  child:
                                      Image.asset(AssetPath.testimonialsImage),
                                ),
                                SizedBox(
                                  width: AppSize.screenWidth! * 0.01,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: "Mohamed Karam",
                                      fontSize: AppSize.defaultSize! * 1.5,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.black,
                                    ),
                                    Row(
                                      children: [
                                        CustomText(
                                          text: "5.0",
                                          fontSize: AppSize.defaultSize! * 1.2,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.pink,
                                        ),
                                        Container(
                                          child:
                                              SvgPicture.asset(AssetPath.star),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            CustomText(
                              text: StringManager.testimonialsCommentsDate.tr(),
                              fontSize: AppSize.defaultSize! * 1.5,
                              fontWeight: FontWeight.w500,
                              color: AppColors.greyColor,
                            ),
                          ],
                        ),
                        CustomText(
                          text: StringManager.aboutPlaceDescription.tr(),
                          fontSize: AppSize.defaultSize! * 1.3,
                          overflow: TextOverflow.visible,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.justify,
                          color: AppColors.greyColor,
                        ), //----------
                      ],
                    ),
                    SizedBox(
                      height: AppSize.screenHeight! * 0.01,
                    ),
                    InkWell(
                      child: MainButton(
                        text: StringManager.bookNow.tr(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
