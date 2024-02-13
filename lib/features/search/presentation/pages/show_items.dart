import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/resource_manager/asset_path.dart';
import '../../../../core/resource_manager/colors.dart';
import '../../../../core/resource_manager/string_manager.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/widgets/custom_search_field.dart';
import '../widgets/custom_tapbar.dart';

class ShowItems extends StatefulWidget {
  ShowItems({super.key});

  @override
  State<ShowItems> createState() => _ShowItemsState();
}

class _ShowItemsState extends State<ShowItems> {
  TextEditingController searchController = TextEditingController();
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    searchController.text = "Cake";
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
                controller: searchController,
                readOnly: false,
                onTap: () {},
                labelText: StringManager.search,
                prefixIcon: SvgPicture.asset(AssetPath.searchPrefixIcon),
                suffixIcon: InkWell(
                  child: SvgPicture.asset(AssetPath.searchSuffixIcon),
                ),
              ),
              CustomTapBar(),
            ],
          ),
        ),
      ),
    );
  }
}
