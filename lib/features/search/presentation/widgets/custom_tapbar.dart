import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:monasbatek/core/resource_manager/colors.dart';
import 'package:monasbatek/core/resource_manager/string_manager.dart';

import '../../../../core/resource_manager/asset_path.dart';
import '../../../../core/resource_manager/routes.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/widgets/custom_items_decoration.dart';
import '../../../../core/widgets/custom_provider_items_decoration.dart';

class CustomTapBar extends StatelessWidget {
  const CustomTapBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              left: AppSize.defaultSize! * 1.5,
              right: AppSize.defaultSize! * 1.5,
            ),
            child: Container(
              height: AppSize.screenHeight! * 0.07,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.white,
              ),
              child: TabBar(
                tabs: [
                  Container(
                    child: Text(
                      StringManager.provider.tr(),
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      StringManager.product.tr(),
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: AppSize.screenHeight! * 0.01,
          ),
          Container(
            //Add this to give height
            height: MediaQuery.of(context).size.height,
            child: TabBarView(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: AppSize.defaultSize! * 1.5,
                    right: AppSize.defaultSize! * 1.5,
                  ),
                  child: CustomProviderItemsDecoration(),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: AppSize.defaultSize! * 1.5,
                    right: AppSize.defaultSize! * 1.5,
                  ),
                  child: GridView.builder(
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
                          companyName: StringManager.companyName,
                          productName: StringManager.productName,
                          productPrice: StringManager.productPrice,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
