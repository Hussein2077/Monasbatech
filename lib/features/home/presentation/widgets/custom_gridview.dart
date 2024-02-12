import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monasbatek/core/resource_manager/asset_path.dart';
import 'package:monasbatek/core/resource_manager/colors.dart';
import 'package:monasbatek/core/utils/app_size.dart';
import 'package:monasbatek/core/widgets/cached_network_image.dart';
import 'package:monasbatek/features/home/data/models/categoty_model.dart';

import '../../../../core/resource_manager/string_manager.dart';

class CustomGridViewCard extends StatelessWidget {
  const CustomGridViewCard({super.key, required this.categoryModel});

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.defaultSize! * 1.6),
        color: AppColors.gridViewContainerColor,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CachedNetworkCustom(
              url: categoryModel.image??"",
            ),
            Text(
              categoryModel.name??"",
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
