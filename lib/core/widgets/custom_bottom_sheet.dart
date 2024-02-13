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
          height: AppSize.screenHeight! * 0.35,
          decoration: BoxDecoration(
            color: AppColors.backGroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(17),
              topRight: Radius.circular(17),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Center(child: widget),
          ),
        );
      });
}
