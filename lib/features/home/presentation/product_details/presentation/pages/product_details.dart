import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monasbatek/core/resource_manager/asset_path.dart';
import 'package:monasbatek/core/resource_manager/colors.dart';
import 'package:monasbatek/core/resource_manager/string_manager.dart';
import 'package:monasbatek/core/utils/app_size.dart';
import 'package:monasbatek/core/widgets/custom_text_field.dart';
import 'package:monasbatek/core/widgets/cutom_text.dart';
import 'package:monasbatek/core/widgets/main_button.dart';
import 'package:monasbatek/features/home/data/models/item_model.dart';

import '../../../../../../core/widgets/custom_bottom_sheet.dart';
import '../../../widgets/bottom_sheet_content.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.itemData});
final ItemData itemData;
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int _selectedValue = 1;
  int itemsCount = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
                    color: AppColors.black,
                  ),
                ),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: AppSize.screenHeight! * 0.5,
                  width: AppSize.screenWidth! * 0.13,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset(
                      AssetPath.uploadIcon,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    //------------ add product list of images ----------
                    // Center(
                    //   child: Image.asset(AssetPath.productDetailsImage),
                    // ),
                    SizedBox(
                      height: AppSize.defaultSize! * 1.2,
                    ),
                    //--------- add product title -----------
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                           widget.itemData.name??"",
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              color: Color(0xFF121212),
                              fontSize: 18,
                              fontFamily: 'Almarai',
                              fontWeight: FontWeight.w700,
                              height: 0.07,
                            ),
                          ),
                        ),
                        //------------ add favourite Icon --------
                        InkWell(
                          onTap: () {},
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: SvgPicture.asset(AssetPath.heart),
                          ),
                        ),
                      ],
                    ),

                    Divider(),
                    //--------------- add store Details -------
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              child: Image.asset(AssetPath.profileCompanyImg),
                            ),
                            SizedBox(
                              width: AppSize.defaultSize! * 0.5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  StringManager.companyName.tr(),
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: AppSize.defaultSize! * 1.6,
                                    fontWeight: FontWeight.w700,
                                    height: 0.08,
                                  ),
                                ),
                                SizedBox(
                                  height: AppSize.defaultSize! * 2,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      child:
                                          SvgPicture.asset(AssetPath.location),
                                    ),
                                    Text(
                                      StringManager.destination.tr(),
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: AppColors.greyColor,
                                        fontSize: AppSize.defaultSize! * 1.5,
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: SvgPicture.asset(
                              AssetPath.profileChatIcon,
                            ),
                          ),
                        ),
                      ],
                    ),
                    //--------------- add store description title -------
                    SizedBox(
                      height: AppSize.defaultSize! * 1.5,
                    ),
                    Row(
                      children: [
                        Text(
                          StringManager.descriptionTitle.tr(),
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: AppSize.defaultSize! * 2,
                            fontWeight: FontWeight.w700,
                            height: 0.08,
                          ),
                        ),
                      ],
                    )
                    //--------------- add store description -------
                    ,
                    SizedBox(
                      height: AppSize.defaultSize! * 1.5,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            StringManager.description.tr(),
                            style: TextStyle(
                              color: AppColors.greyColor,
                              fontSize: AppSize.defaultSize! * 1.5,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    SizedBox(
                      height: AppSize.defaultSize! * 1.5,
                    ),
                    //--------------- add Product size title -------
                    Row(
                      children: [
                        Text(
                          StringManager.chooseSize.tr(),
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: AppSize.defaultSize! * 2,
                            fontWeight: FontWeight.w700,
                            height: 0.08,
                          ),
                        ),
                      ],
                    ),
                    //--------------- add Product sizes -------
                    SizedBox(
                      height: AppSize.defaultSize! * 1.5,
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          // width: AppSize.screenWidth! * 0.3,
                          child: RadioListTile(
                            value: 1,
                            groupValue: _selectedValue,
                            onChanged: (value) {
                              setState(() {
                                _selectedValue =
                                    value!; // Update _selectedValue when option 1 is selected
                              });
                            },
                            title:CustomText(
                              text:StringManager.small.tr() ,
                              fontSize: AppSize.defaultSize!*1.4,
                              fontWeight: FontWeight.w500,
                            ) ,
                          ),
                        ),
                        Expanded(
                          // width: AppSize.screenWidth! * 0.35,
                          child: RadioListTile(
                            value: 2,
                            groupValue: _selectedValue,
                            onChanged: (value) {
                              setState(() {
                                _selectedValue =
                                    value!; // Update _selectedValue when option 1 is selected
                              });
                            },

                            title: CustomText(
                              text:StringManager.medium.tr() ,
                              fontSize: AppSize.defaultSize!*1.4,
                              fontWeight: FontWeight.w500,
                            ) ,
                          ),
                        ),
                        Expanded(
                          // width: AppSize.screenWidth! * 0.3,
                          child: RadioListTile(
                            value: 3,
                            groupValue: _selectedValue,
                            onChanged: (value) {
                              setState(() {
                                _selectedValue =
                                    value!; // Update _selectedValue when option 1 is selected
                              });
                            },
                            title: CustomText(
                              text:StringManager.large.tr() ,
                              fontSize: AppSize.defaultSize!*1.4,
                              fontWeight: FontWeight.w500,
                            ) ,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppSize.defaultSize! * 1.5,
                    ),
                    //--------------- add Product special instructions title -------
                    Row(
                      children: [
                        Text(
                          StringManager.specialInstructions.tr(),
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: AppSize.defaultSize! * 2,
                            fontWeight: FontWeight.w700,
                            height: 0.08,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppSize.defaultSize! * 1.5,
                    ),
                    //--------------- add Product special instructions container -------
                    CustomTextField(
                      minLines: 5,
                      hintText: StringManager.writeHere.tr(),
                      height: AppSize.screenHeight! * 0.1,
                      hintStyle: TextStyle(color: AppColors.greyColor),
                    ),
                    SizedBox(
                      height: AppSize.defaultSize! * 1.5,
                    ),
                    //--------- Add order and price details -----
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(17),
                      topRight: Radius.circular(17),
                    ),
                  ),
                  //  height: AppSize.screenHeight! * 0.1,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 25, left: 20, right: 20, bottom: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Total : 1305 RS",
                                style: TextStyle(
                                  color: AppColors.pink,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  height: 0.09,
                                ),
                              ),
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
                                        color: AppColors.pink,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                                        color: AppColors.greyColor
                                            .withOpacity(0.5),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                          //--------- add button add to cart ----
                          SizedBox(
                            height: AppSize.screenHeight! * 0.02,
                          ),
                          MainButton(
                            text: StringManager.addToCard.tr(),
                            onTap: () {
                              showCustomBottomSheet(
                                context,
                                BottomSheetContent(),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
