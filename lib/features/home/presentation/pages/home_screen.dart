import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monasbatek/core/resource_manager/asset_path.dart';
import 'package:monasbatek/core/resource_manager/colors.dart';
import 'package:monasbatek/features/home/presentation/widgets/custom_bottom_navigation.dart';

import '../../../../core/resource_manager/string_manager.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/widgets/custom_search_field.dart';
import '../widgets/custom_gridview.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppSize().init(context);
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.backGroundColor),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: AppSize.defaultSize!*1.6,
              right: AppSize.defaultSize!* 2.4,
              left:  AppSize.defaultSize!*2.4,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular( AppSize.defaultSize!*4),
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            maxRadius: AppSize.defaultSize! * 2.5,
                            child: Image.asset(AssetPath.profile),
                          ),
                        ),
                        SizedBox(
                          width: AppSize.defaultSize! * 1,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              StringManager.hello.tr(),
                              style: TextStyle(
                                  fontSize: AppSize.defaultSize! * 1.5),
                            ),
                            Text(
                              StringManager.profileName.tr(),
                              style: TextStyle(
                                  fontSize: AppSize.defaultSize! * 1.8,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular( AppSize.defaultSize!*1.7),
                          border: Border.all(color: AppColors.pink)),
                      width: AppSize.screenWidth! * 0.115,
                      height: AppSize.screenHeight! * 0.055,
                      child: Center(
                        child: SvgPicture.asset(AssetPath.notification),
                      ),
                    ),
                  ],
                ),
                //------------- add search text field ------------
                SizedBox(
                  height: AppSize.defaultSize! * 1.2,
                ),
                CustomSearchField(
                  labelText: StringManager.search,
                  prefixIcon: SvgPicture.asset(AssetPath.searchPrefixIcon),
                  suffixIcon: SvgPicture.asset(AssetPath.searchSuffixIcon),
                ),
                //--------- add home page banner --------------
                Center(
                  child: SizedBox(
                    child: Image.asset(AssetPath.homeBanner),
                  ),
                ),
                //--------------- Add title for GridgView-----
                SizedBox(
                  height: AppSize.defaultSize! * 1.2,
                ),
                Text(
                  StringManager.askOccasion,
                  style: TextStyle(
                    fontSize: AppSize.defaultSize! * 2,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //--------------- AddGridgView-----
                SizedBox(
                  height: AppSize.defaultSize! * 1.2,
                ),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: AppSize.defaultSize! * 0.1,
                    crossAxisSpacing: AppSize.defaultSize! * 1.5,
                    mainAxisSpacing: AppSize.defaultSize! * 1.5,
                  ),
                  itemBuilder: (context, index) {
                    return const CustomGridView();
                  },
                )
              ],
            ),
          ),
        ),
      ),
      // -------- add bottom navigation Bar -------
      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }
}
