import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:monasbatek/core/resource_manager/asset_path.dart';
import 'package:monasbatek/core/resource_manager/colors.dart';
import 'package:monasbatek/core/resource_manager/routes.dart';
import 'package:monasbatek/core/resource_manager/string_manager.dart';
import 'package:monasbatek/core/utils/app_size.dart';
import 'package:monasbatek/core/widgets/app_bar.dart';
import 'package:monasbatek/core/widgets/cutom_text.dart';
import 'package:monasbatek/core/widgets/main_button.dart';
import 'package:monasbatek/features/cart/presentation/widgets/radio_list_cart.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int? selectedValue = 1;
  int itemsCount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, text: StringManager.cart.tr(), arrowBack: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RadioListCart().animate().fade().scale(),
          Divider(
            color: AppColors.greyColor.withOpacity(.5),
          ),
          RadioListCart().animate().fade().scale(),
          Divider(
            color: AppColors.greyColor.withOpacity(.5),
          ),
          SizedBox(
            height: AppSize.defaultSize! * 2.4,
          ),
          Padding(
            padding: EdgeInsets.only(left: AppSize.defaultSize! * 2),
            child: CustomText(
              text: StringManager.suggestion.tr(),
              fontWeight: FontWeight.w700,
              fontSize: AppSize.defaultSize! * 1.6,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: AppSize.defaultSize!),
            child: SizedBox(
              height: AppSize.defaultSize! * 14,
              child: ListView.builder(
                  itemCount: 15,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(AppSize.defaultSize!),
                      child: Image.asset(
                        AssetPath.cake,
                        height: AppSize.defaultSize! * 12,
                        width: AppSize.defaultSize! * 12,
                      ),
                    );
                  }),
            ),
          ),
          const Spacer(),
          Material(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppSize.defaultSize! * 3),
                topRight: Radius.circular(AppSize.defaultSize! * 3)),
            child: SizedBox(
              width: AppSize.screenWidth!,
              height: AppSize.screenHeight! * .35,
              child: Padding(
                padding: EdgeInsets.all(AppSize.defaultSize! * 4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: StringManager.total.tr(),
                          fontSize: AppSize.defaultSize! * 1.6,
                          fontWeight: FontWeight.w700,
                        ),
                        CustomText(
                          text: '50.32 EGP',
                          fontSize: AppSize.defaultSize! * 1.6,
                          color: AppColors.primaryColor.withOpacity(.8),
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: StringManager.total.tr(),
                          fontSize: AppSize.defaultSize! * 1.6,
                          fontWeight: FontWeight.w700,
                        ),
                        CustomText(
                          text: '50.32 EGP',
                          fontSize: AppSize.defaultSize! * 1.6,
                          color: AppColors.primaryColor.withOpacity(.8),
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: StringManager.total.tr(),
                          fontSize: AppSize.defaultSize! * 1.8,
                          fontWeight: FontWeight.w700,
                        ),
                        CustomText(
                          text: '50.32 EGP',
                          fontSize: AppSize.defaultSize! * 1.8,
                          color: AppColors.primaryColor.withOpacity(.8),
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    ),   SizedBox(
                      height: AppSize.defaultSize! * 2.4,
                    ),
                    MainButton(text: StringManager.buy.tr(),onTap: (){
                      Navigator.pushNamed(context, Routes.buyingDone);
                    },),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
