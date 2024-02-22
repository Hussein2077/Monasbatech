import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/resource_manager/asset_path.dart';
import '../../../../core/resource_manager/colors.dart';
import '../../../../core/resource_manager/string_manager.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/widgets/cutom_text.dart';

class EditPhotoWidget extends StatelessWidget {
  const EditPhotoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Image.asset(AssetPath.profile),
        ),
        Container(
          width: AppSize.screenWidth! * 0.8,
          height: AppSize.screenHeight! * 0.06,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.defaultSize! * 1),
            border: Border.all(color: AppColors.pink),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: StringManager.changeProfilePhoto,
                  color: AppColors.pink,
                  fontWeight: FontWeight.w600,
                  fontSize: AppSize.defaultSize! * 1.5,
                ),
                SizedBox(
                  width: AppSize.screenWidth! * 0.02,
                ),
                Container(
                  child: SvgPicture.asset(AssetPath.camera),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
