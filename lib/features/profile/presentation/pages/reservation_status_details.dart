import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monasbatek/core/widgets/cutom_text.dart';

import '../../../../core/resource_manager/asset_path.dart';
import '../../../../core/resource_manager/colors.dart';
import '../../../../core/resource_manager/string_manager.dart';
import '../../../../core/utils/app_size.dart';

class ReservationStatusDetails extends StatelessWidget {
  const ReservationStatusDetails({super.key});

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
          ],
        ),
      ),
    );
  }
}
