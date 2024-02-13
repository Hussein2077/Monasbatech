import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:monasbatek/core/resource_manager/asset_path.dart';
import 'package:monasbatek/core/resource_manager/colors.dart';
import 'package:monasbatek/core/resource_manager/routes.dart';
import 'package:monasbatek/core/resource_manager/string_manager.dart';
import 'package:monasbatek/core/utils/app_size.dart';
import 'package:monasbatek/core/widgets/app_bar.dart';
import 'package:monasbatek/core/widgets/custom_text_field.dart';
import 'package:monasbatek/core/widgets/cutom_text.dart';
import 'package:monasbatek/core/widgets/main_button.dart';
import 'package:monasbatek/features/cart/presentation/widgets/product_container.dart';

class BuyingDone extends StatefulWidget {
  const BuyingDone({super.key});

  @override
  State<BuyingDone> createState() => _BuyingDoneState();
}

class _BuyingDoneState extends State<BuyingDone> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, text: StringManager.confirmTheProcess.tr()),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(AppSize.defaultSize! * 2.4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: StringManager.address.tr(),
                    fontSize: AppSize.defaultSize! * 2,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(
                    height: AppSize.defaultSize! * 2,
                  ),
                  DottedBorder(
                    color: AppColors.greyColor,
                    //color of dotted/dash line
                    strokeWidth: 1,
                    radius: Radius.circular(AppSize.defaultSize! * 3),

                    //thickness of dash/dots
                    dashPattern: [10, 8],
                    child: Container(
                      height: AppSize.defaultSize! * 5.6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSize.defaultSize! * 3),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(AssetPath.plus),
                            SizedBox(
                              width: AppSize.defaultSize!,
                            ),
                            CustomText(
                              text: StringManager.chooseAddress.tr(),
                              fontSize: AppSize.defaultSize! * 1.4,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppSize.defaultSize! * 2.4,
                  ),
                  CustomText(
                    text: StringManager.product.tr(),
                    fontSize: AppSize.defaultSize! * 2,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(
                    height: AppSize.defaultSize! * 1.8,
                  ),
                 ProductsContainer(),
                  SizedBox(
                    height: AppSize.defaultSize! * 1.6,
                  ),
                 ProductsContainer(),
                  SizedBox(
                    height: AppSize.defaultSize! * 2.4,
                  ),
                  Container(
                    height: AppSize.defaultSize! * 5.1,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.circular(AppSize.defaultSize! * 1.4)),
                    child: CustomTextField(
                      hintText: StringManager.coupon.tr(),
                      hintStyle:   const TextStyle(
                        color: AppColors.greyColor,

                      ),
                      suffixIcon: MainButton(text: StringManager.confirm.tr(),
                      width: AppSize.defaultSize!*7.5,
                        fontSize: AppSize.defaultSize!,
                        borderRadius: AppSize.defaultSize!*3,
                      ),
                    ),
                  ),

                ],
              ),
            ),
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
                        Navigator.pushNamed(context, Routes.choosePayment);
                      },),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
