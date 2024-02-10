import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resource_manager/asset_path.dart';
import '../../../../core/resource_manager/colors.dart';
import '../../../../core/resource_manager/routes.dart';
import '../../../../core/resource_manager/string_manager.dart';
import '../../../../core/utils/app_size.dart';
import '../widgets/custom_gridview.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppSize().init(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            StringManager.partyName.tr(),
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
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //----- Add sub category message ---------
                Text(
                  StringManager.happyBirth,
                  style: TextStyle(
                    fontSize: AppSize.defaultSize! * 2,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //--------------- sub category grid view ------
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
                    return InkWell(
                      onTap: () => Navigator.of(context)
                          .pushNamed(Routes.subCategoryItems),
                      child: const CustomGridView(),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
