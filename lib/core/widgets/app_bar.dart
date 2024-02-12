import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monasbatek/core/resource_manager/asset_path.dart';
import 'package:monasbatek/core/utils/app_size.dart';
import 'package:monasbatek/core/widgets/cutom_text.dart';

AppBar appBar(BuildContext context,
    {required String text, bool arrowBack = true}) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 1,
    title: CustomText(
      text: text,
      fontSize: AppSize.defaultSize! * 2,
      fontWeight: FontWeight.w700,
    ),
    centerTitle: true,
    leading: arrowBack
        ? Padding(
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
          )
        : const SizedBox(),
  );
}

AppBar homeAppBar(BuildContext context,
    {String? text, void Function()? actionsOnPressed, Widget? widget}) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 1,
    title: widget ??
        Text(
          '$text',
          style: TextStyle(fontSize: AppSize.defaultSize! * 1.5),
        ),
    centerTitle: true,
    // leading: IconButton(
    //   onPressed: () {
    //     Scaffold.of(context).openDrawer();
    //   },
    //   icon: Image.asset(
    //     AssetPath.menu,
    //     width: AppSize.defaultSize! * 2,
    //     height: AppSize.defaultSize! * 2,
    //   ),
    // ),
    // actions: [
    //   IconButton(
    //     onPressed: actionsOnPressed,
    //     icon: Image.asset(
    //       AssetPath.notification,
    //       width: AppSize.defaultSize! * 2,
    //       height: AppSize.defaultSize! * 2,
    //     ),
    //   )
    // ],
  );
}
