import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:monasbatek/core/resource_manager/colors.dart';
import 'package:monasbatek/core/utils/app_size.dart';

import '../resource_manager/string_manager.dart';

void showCustomBottomSheet(BuildContext context, Widget widget) {
  showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return Container(
          height: AppSize.screenHeight! * 0.45,
          decoration: BoxDecoration(
            color: AppColors.backGroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppSize.defaultSize!*1.7),
              topRight: Radius.circular(AppSize.defaultSize!*1.7),
            ),
          ),
          child: Padding(
            padding:   EdgeInsets.only(top: AppSize.defaultSize!*4),
            child: Center(child: widget),
          ),
        );
      });
}
