import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:monasbatek/core/resource_manager/asset_path.dart';
import 'package:monasbatek/core/resource_manager/routes.dart';
import 'package:monasbatek/core/widgets/main_button.dart';

import '../../../../core/resource_manager/colors.dart';
import '../../../../core/resource_manager/string_manager.dart';
import '../../../../core/utils/app_size.dart';

class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // message succcess add to card
        Text(
          StringManager.addToCardSuccess.tr(),
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Color(0xFF109549),
            fontSize: AppSize.defaultSize! * 1.6,
            fontWeight: FontWeight.w700,
            height: 0.09,
          ),
        ),
        SizedBox(
          height: AppSize.screenHeight! * 0.02,
        ),
        SizedBox(
          width: AppSize.screenWidth! * 0.5,
          child: Divider(),
        ),
        SizedBox(
          height: AppSize.screenHeight! * 0.02,
        ),
        // some order details such as product name , price and suggest buy or late

        Padding(
          padding: EdgeInsets.only(
            left: AppSize.defaultSize! * 2.5,
            right: AppSize.defaultSize! * 2.5,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Image.asset(
                  AssetPath.productPreview,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: AppSize.defaultSize! * 0.7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      StringManager.productDetailsName.tr(),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: AppSize.defaultSize! * 1.5,
                        fontWeight: FontWeight.w700,
                        height: 0.12,
                      ),
                    ),
                    SizedBox(
                      height: AppSize.defaultSize! * 2,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          child: Image.asset(AssetPath.companyImg),
                        ),
                        SizedBox(
                          width: AppSize.screenWidth! * 0.01,
                        ),
                        Text(
                          StringManager.companyName,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: AppColors.greyColor,
                            fontSize: AppSize.defaultSize! * 1.5,
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppSize.defaultSize! * 2,
                    ),
                    Text(
                      StringManager.productPrice.tr(),
                      style: TextStyle(
                        color: AppColors.pink,
                        fontSize: AppSize.defaultSize! * 1.8,
                        fontWeight: FontWeight.w700,
                        height: 0.12,
                      ),
                    )
                  ],
                ),
              ),
              // number of items
              CircleAvatar(
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
        // add button buy now or later

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MainButton(
                text: StringManager.buy.tr(),
                onTap: () {
                  Navigator.pushNamed(context, Routes.choosePayment);
                },
                width: AppSize.screenWidth! * 0.4,
              ),
              MainButton(
                text: StringManager.later.tr(),
                color: AppColors.white,
                onTap: () {
                  Navigator.pop(context);
                },
                textColor: AppColors.pink,
                width: AppSize.screenWidth! * 0.4,
              ),
            ],
          ),
        )
      ],
    );
  }
}
