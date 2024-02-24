import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monasbatek/core/resource_manager/asset_path.dart';
import 'package:monasbatek/core/resource_manager/colors.dart';
import 'package:monasbatek/core/resource_manager/string_manager.dart';
import 'package:monasbatek/core/widgets/cached_network_image.dart';

import '../utils/app_size.dart';

class CustomItemsDecoration extends StatelessWidget {
  const CustomItemsDecoration(
      {super.key,
      required this.imagePath,
      required this.productName,
      required this.productPrice,
      required this.companyName,
      required this.companyImg,
      required this.favouriteFunction});

  final String imagePath;
  final String productName;
  final String productPrice;
  final String companyName;
  final String companyImg;
  final Function favouriteFunction;

  @override
  Widget build(BuildContext context) {
    AppSize().init(context);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              CachedNetworkCustom(
                url: imagePath,
                width: AppSize.defaultSize! * 13.8,
                height: AppSize.defaultSize! * 14.8,
              ),
              Positioned(
                top: 5,
                left: 5,
                child: InkWell(
                  onTap: () {
                    favouriteFunction();
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: SvgPicture.asset(AssetPath.heart),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: AppSize.defaultSize! * 1.2,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        productName,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: AppSize.defaultSize! * 1.8,
                          fontWeight: FontWeight.w400,
                          height: 0.09,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppSize.defaultSize! * 1.2,
                ),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        productPrice,
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: AppSize.defaultSize! * 1.5,
                          fontWeight: FontWeight.w700,
                          height: 0,
                          letterSpacing: 0.06,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppSize.defaultSize! * 1.2,
                ),
                Row(
                  children: [
                    CachedNetworkCustom(
                      url: companyImg,
                      width: AppSize.defaultSize! * 2,
                      height: AppSize.defaultSize! * 2,
                    ),
                    SizedBox(
                      width: AppSize.screenWidth! * 0.01,
                    ),
                    Flexible(
                        child: Text(
                      StringManager.companyName,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: AppColors.greyColor,
                        fontSize: AppSize.defaultSize! * 1.5,
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    )),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
