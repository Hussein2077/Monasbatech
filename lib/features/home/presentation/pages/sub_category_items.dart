import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monasbatek/core/widgets/custom_items_decoration.dart';

import '../../../../core/resource_manager/asset_path.dart';
import '../../../../core/resource_manager/colors.dart';
import '../../../../core/resource_manager/routes.dart';
import '../../../../core/resource_manager/string_manager.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/widgets/custom_search_field.dart';

class SubCategoryItems extends StatelessWidget {
  const SubCategoryItems({super.key});

  @override
  Widget build(BuildContext context) {
    AppSize().init(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            StringManager.cake.tr(),
            style: TextStyle(fontSize: AppSize.defaultSize! * 2.5),
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
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: AppSize.defaultSize! * 0.5,
                ),
                //------------- add search text field ------------
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: CustomSearchField(
                    labelText: StringManager.search.tr(),
                    prefixIcon: SvgPicture.asset(AssetPath.searchPrefixIcon),
                    suffixIcon: SvgPicture.asset(AssetPath.searchSuffixIcon),
                  ),
                ),
                SizedBox(
                  height: AppSize.defaultSize! * 1.2,
                ),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: AppSize.defaultSize! * 0.075,
                    crossAxisSpacing: AppSize.defaultSize! * 2.5,
                    mainAxisSpacing: AppSize.defaultSize! * 1.8,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Navigator.of(context)
                          .pushNamed(Routes.productDetails),
                      child: CustomItemsDecoration(
                        favouriteFunction: () {
                          print("Hello Hussein");
                        },
                        imagePath: AssetPath.productImg,
                        companyImg: AssetPath.companyImg,
                        companyName: StringManager.companyName.tr(),
                        productName: StringManager.productName.tr(),
                        productPrice: StringManager.productPrice.tr(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
