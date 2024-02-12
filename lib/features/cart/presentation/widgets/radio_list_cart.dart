import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:monasbatek/core/resource_manager/asset_path.dart';
import 'package:monasbatek/core/resource_manager/colors.dart';
import 'package:monasbatek/core/resource_manager/string_manager.dart';
import 'package:monasbatek/core/utils/app_size.dart';
import 'package:monasbatek/core/widgets/app_bar.dart';
import 'package:monasbatek/core/widgets/cutom_text.dart';

class RadioListCart extends StatefulWidget {
  const RadioListCart({super.key});

  @override
  State<RadioListCart> createState() => _RadioListCartState();
}

class _RadioListCartState extends State<RadioListCart> {
  int? selectedValue = 1;
  int itemsCount = 1;

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      value: 2,
      groupValue: selectedValue,
      onChanged: (value) {
        setState(() {
          selectedValue = value;
        });
      },
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.asset(AssetPath.cho),
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
                fontSize: AppSize.defaultSize! * 1.6,
              ),
              SizedBox(
                height: AppSize.defaultSize! * .5,
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
                    fontSize: AppSize.defaultSize! * 1.2,
                  ),
                ],
              ),
              SizedBox(
                height: AppSize.defaultSize! * .5,
              ),
              CustomText(
                text: '1,500 EGP',
                fontSize: AppSize.defaultSize! * 1.2,
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
        ],
      ),
      activeColor: AppColors.primaryColor, // Customize the selected color
    );
  }
}
