import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/resource_manager/asset_path.dart';
import '../../../../core/resource_manager/colors.dart';
import '../../../../core/resource_manager/string_manager.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/widgets/custom_items_decoration.dart';
import '../../../../core/widgets/custom_provider_items_decoration.dart';
import '../../../../core/widgets/cutom_text.dart';

class MyFavourite extends StatefulWidget {
  MyFavourite({super.key});

  @override
  State<MyFavourite> createState() => _MyFavouriteState();
}

class _MyFavouriteState extends State<MyFavourite> {
  int _selectedIndex = 0; // Track the index of the selected tab
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // استخدم jumpToPage بدلاً من animateToPage لتجنب الانتقال السلس
    _pageController.jumpToPage(index);
  }

  Widget _customTab(String title, int index) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onTabTapped(index),
      child: Container(
        padding: EdgeInsets.all(AppSize.defaultSize! * 0.7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.defaultSize! * 1),
          color: isSelected
              ? AppColors.greyColor.withOpacity(0.2)
              : AppColors.white,
        ),
        child: CustomText(
          text: title.tr(),
          fontSize: AppSize.defaultSize! * 1.7,
          color: isSelected
              ? AppColors.primaryColor
              : AppColors.greyColor.withOpacity(0.5),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          StringManager.favourite.tr(),
          style: TextStyle(fontSize: AppSize.defaultSize! * 2.5),
        ),
        backgroundColor: AppColors.backGroundColor,
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: Container(
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
      body: Padding(
        padding: EdgeInsets.all(AppSize.defaultSize! * 1.5),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(AppSize.defaultSize! * 1),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.defaultSize! * 1),
                  color: AppColors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _customTab(StringManager.product, 0),
                  _customTab(StringManager.shops, 1),
                ],
              ),
            ),
            SizedBox(
              height: AppSize.screenHeight! * 0.03,
            ),
            Expanded(
              // PageView for content
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                children: [
                  //these for products
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: 4,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: AppSize.defaultSize! * 0.075,
                      crossAxisSpacing: AppSize.defaultSize! * 2.5,
                      mainAxisSpacing: AppSize.defaultSize! * 1.8,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {},
                        child: CustomItemsDecoration(
                          favouriteFunction: () {},
                          imagePath:
                              "https://www.top4top.me/do.php?imgf=top4top_me4ea82a25769c1.png",
                          companyImg:
                              "https://www.top4top.me/do.php?imgf=top4top_me2827573da5a31.png",
                          companyName: StringManager.companyName.tr(),
                          productName: StringManager.productName.tr(),
                          productPrice: StringManager.productPrice,
                        ).animate().fade().scale(),
                      );
                    },
                  ),
                  //these for shops

                  ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return CustomProviderItemsDecoration()
                          .animate()
                          .fade()
                          .scale();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
