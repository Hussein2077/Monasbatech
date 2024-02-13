import 'package:flutter/material.dart';
import 'package:monasbatek/core/resource_manager/asset_path.dart';
import 'package:monasbatek/core/resource_manager/colors.dart';
import 'package:monasbatek/core/utils/app_size.dart';
import 'package:monasbatek/core/widgets/cutom_text.dart';
class ProductsContainer extends StatefulWidget {
  const ProductsContainer({super.key});

  @override
  State<ProductsContainer> createState() => _ProductsContainerState();
}

class _ProductsContainerState extends State<ProductsContainer> {
  int itemsCount = 1;

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: AppSize.defaultSize! * 8.3,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
          BorderRadius.circular(AppSize.defaultSize! * 1.4)),
      child: Padding(
        padding:   EdgeInsets.all(AppSize.defaultSize!),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center  ,
            children: [
              Image.asset(AssetPath.cho,
                width: AppSize.defaultSize!*6,
                height: AppSize.defaultSize!*6,
              ),
              SizedBox(
                width: AppSize.defaultSize!,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomText(
                    text: 'Chocolate',
                    fontWeight: FontWeight.w700,
                    fontSize: AppSize.defaultSize! * 1.4,
                  ),
                  SizedBox(
                    height: AppSize.defaultSize! * .4,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        AssetPath.cho,
                        width: AppSize.defaultSize! * 2,
                        height: AppSize.defaultSize! * 2,
                      ),
                      SizedBox(
                        width: AppSize.defaultSize! * .5,
                      ),
                      CustomText(
                        text: 'MONO',
                        fontSize: AppSize.defaultSize!,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppSize.defaultSize! * .5,
                  ),
                  CustomText(
                    text: '1,500 EGP',
                    fontSize: AppSize.defaultSize!,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryColor,
                  ),
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            itemsCount++;
                          });
                        },
                        child: Container(
                          width: 28,
                          height: 28,
                          decoration: ShapeDecoration(
                            color: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: AppSize.screenWidth! * 0.02,
                      ),
                      Text(
                        "$itemsCount",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 13.50,
                          fontFamily: 'Almarai',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      SizedBox(
                        width: AppSize.screenWidth! * 0.02,
                      ),
                      //----- decrease items counts ----------
                      InkWell(
                        onTap: () {
                          setState(() {
                            itemsCount--;
                          });
                        },
                        child: Container(
                          width: 28,
                          height: 28,
                          decoration: ShapeDecoration(
                            color: AppColors.greyColor.withOpacity(0.5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
