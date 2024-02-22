import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monasbatek/core/resource_manager/asset_path.dart';
import 'package:monasbatek/core/resource_manager/colors.dart';
import 'package:monasbatek/core/resource_manager/string_manager.dart';
import 'package:monasbatek/core/widgets/cutom_text.dart';

import '../../../../core/utils/app_size.dart';

class OrderStatusWidget extends StatelessWidget {
  final String productImage;
  final String productName;
  final String companyName;
  final String companyImage;
  final String productPrice;
  final String orderStatus;
  final Color orderStatusColor;
  OrderStatusWidget(
      {super.key,
      required this.productImage,
      required this.productName,
      required this.companyName,
      required this.companyImage,
      required this.productPrice,
      required this.orderStatus,
      required this.orderStatusColor});

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
                    child: Image.asset(
                      productImage,
                    ),
                  ),
                  SizedBox(
                    width: AppSize.screenWidth! * 0.02,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: productName,
                        color: AppColors.primaryColor,
                        fontSize: AppSize.defaultSize! * 2,
                        fontWeight: FontWeight.w500,
                      ),
                      Row(
                        children: [
                          Container(
                            child: Image.asset(companyImage),
                          ),
                          SizedBox(
                            width: AppSize.screenWidth! * 0.01,
                          ),
                          CustomText(
                            text: companyName,
                            color: AppColors.greyColor,
                          ),
                        ],
                      ),
                      CustomText(
                        text: productPrice,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(AppSize.defaultSize! * 1),
                        color: AppColors.white),
                    padding: EdgeInsets.all(AppSize.defaultSize! * 0.8),
                    child: CustomText(
                      text: orderStatus,
                      color: orderStatusColor,
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
