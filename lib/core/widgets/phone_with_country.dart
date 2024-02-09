import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:monasbatek/core/resource_manager/colors.dart';
import 'package:monasbatek/core/resource_manager/string_manager.dart';
import 'package:monasbatek/core/utils/app_size.dart';


class PhoneWithCountry extends StatefulWidget {
  const PhoneWithCountry({super.key});

  static PhoneNumber number = PhoneNumber(isoCode: 'EG');
  static bool phoneIsValid = false;

  @override
  State<PhoneWithCountry> createState() => _PhoneWithCountryState();
}

class _PhoneWithCountryState extends State<PhoneWithCountry> {

  late TextEditingController phonecontroller;

  @override
  void initState() {
    phonecontroller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    phonecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSize.defaultSize!),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppSize.defaultSize! )),
      width: MediaQuery.of(context).size.width - 50,
      height: AppSize.defaultSize! * 7.5,
      child: InternationalPhoneNumberInput(
        inputBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(AppSize.defaultSize! * 2)),
        onInputChanged: (PhoneNumber number) {
          PhoneWithCountry.number = number;
        },
        onInputValidated: (bool value) {
          PhoneWithCountry.phoneIsValid = value;
        },
        cursorColor: AppColors.secondaryBackGroundColor,
        textStyle: const TextStyle(color: Colors.pink,
        ),
        inputDecoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(AppSize.defaultSize! * 2)),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.blackColor),
              borderRadius: BorderRadius.circular(AppSize.defaultSize! * 2)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(AppSize.defaultSize! * 2)),
          disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(AppSize.defaultSize! * 2)),

          // focusedErrorBorder:OutlineInputBorder(
          //     borderSide: const BorderSide(color: Colors.red),
          //     borderRadius: BorderRadius.circular(AppSize.defaultSize! * 2)),
          // errorBorder:OutlineInputBorder(
          //     borderSide: const BorderSide(color:  AppColors.primaryColor),
          //     borderRadius: BorderRadius.circular(AppSize.defaultSize! * 2)),
          filled: true,
          fillColor: Colors.white,
          hintText: StringManager.enterYourMobile.tr(),

        ),
        selectorConfig: const SelectorConfig(
            useEmoji: true,
            leadingPadding: 0,
            trailingSpace: false,
            selectorType: PhoneInputSelectorType.BOTTOM_SHEET),
        ignoreBlank: false,
        autoValidateMode: AutovalidateMode.onUserInteraction,
        selectorTextStyle: const TextStyle(color: Colors.black),
        initialValue: PhoneWithCountry.number,
        textFieldController: phonecontroller,
        formatInput: true,
        keyboardType:
        const TextInputType.numberWithOptions(signed: true, decimal: true),
        onSubmit: () {
          getPhoneNumber(PhoneWithCountry.number);
        },
      ),
    );
  }

  void getPhoneNumber(PhoneNumber phoneNumber) async {
    PhoneNumber number = await PhoneNumber.getRegionInfoFromPhoneNumber(
        phoneNumber.phoneNumber!, phoneNumber.dialCode!);
    if (mounted) {
      setState(() {
        PhoneWithCountry.number = number;
      });
    }
  }
}
