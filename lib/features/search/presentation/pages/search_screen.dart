import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monasbatek/core/widgets/custom_bottom_sheet.dart';
import 'package:monasbatek/core/widgets/custom_search_field.dart';
import 'package:monasbatek/core/widgets/cutom_text.dart';

import '../../../../core/resource_manager/asset_path.dart';
import '../../../../core/resource_manager/colors.dart';
import '../../../../core/resource_manager/string_manager.dart';
import '../../../../core/utils/app_size.dart';
import '../widgets/custom_search_bottom_sheet.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          StringManager.searchTtitle.tr(),
          style: TextStyle(fontSize: AppSize.defaultSize! * 2.1),
        ),
        backgroundColor: AppColors.backGroundColor,
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: AppSize.screenHeight! * 0.5,
              width: AppSize.screenWidth! * 0.5,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(
              color: AppColors.white,
            ),
            // search custom field
            CustomSearchField(
              readOnly: false,
              onTap: () {},
              labelText: StringManager.search,
              prefixIcon: SvgPicture.asset(AssetPath.searchPrefixIcon),
              suffixIcon: InkWell(
                onTap: () => showCustomBottomSheet(
                  context,
                  CustomSearchBottomSheet(),
                ),
                child: SvgPicture.asset(AssetPath.searchSuffixIcon),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: AppSize.defaultSize! * 1.5,
                right: AppSize.defaultSize! * 1.5,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      CustomText(
                        color: AppColors.black,
                        text: StringManager.recently.tr(),
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppSize.screenHeight! * 0.01,
                  ),
                  //List view builder for show recent search
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 2,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  StringManager.flower.tr(),
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: AppColors.greyColor,
                                    fontSize: AppSize.defaultSize! * 1.5,
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                                Container(
                                  child: SvgPicture.asset(
                                      AssetPath.removeRecentSearch),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: AppSize.screenHeight! * 0.01,
                            ),
                          ],
                        );
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
