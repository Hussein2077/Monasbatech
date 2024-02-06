import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monasbatek/core/resource_manager/asset_path.dart';
import 'package:monasbatek/core/resource_manager/colors.dart';
import 'package:monasbatek/core/utils/app_size.dart';

import '../../../../core/resource_manager/string_manager.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.gridViewContainerColor,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: AppSize.screenWidth! * 0.15,
              height: AppSize.screenHeight! * 0.15,
              child: SvgPicture.asset(AssetPath.partyImage),
            ),
            Text(
              StringManager.partyName,
              style: TextStyle(
                  fontSize: AppSize.defaultSize! * 1.7,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
