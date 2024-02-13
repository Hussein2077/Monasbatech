import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monasbatek/core/resource_manager/asset_path.dart';
import 'package:monasbatek/core/resource_manager/colors.dart';
import 'package:monasbatek/core/utils/app_size.dart';

import '../resource_manager/string_manager.dart';

class CustomProviderItemsDecoration extends StatelessWidget {
  const CustomProviderItemsDecoration({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.white,
              ),
              child: Column(
                children: [
                  Container(
                    height: AppSize.screenHeight! * 0.15,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AssetPath.providerImg),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Row(
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
                                        child: SvgPicture.asset(
                                            AssetPath.location),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SvgPicture.asset(
                                AssetPath.star,
                              ),
                              const Text(
                                '4.5',
                                style: TextStyle(
                                  color: Color(0xFFEF9F27),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  height: 0.10,
                                  letterSpacing: -0.18,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
