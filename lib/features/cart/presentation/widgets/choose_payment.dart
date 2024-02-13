import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:monasbatek/core/resource_manager/string_manager.dart';
import 'package:monasbatek/core/utils/app_size.dart';
import 'package:monasbatek/core/widgets/app_bar.dart';
import 'package:monasbatek/core/widgets/cutom_text.dart';
import 'package:monasbatek/core/widgets/main_button.dart';

class ChoosePayment extends StatefulWidget {
  const ChoosePayment({super.key});

  @override
  State<ChoosePayment> createState() => _ChoosePaymentState();
}

class _ChoosePaymentState extends State<ChoosePayment> {
  int? selectedValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, text: StringManager.payment.tr()),
      body: Padding(
        padding: EdgeInsets.all(AppSize.defaultSize!),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(AppSize.defaultSize!*2),
              child: CustomText(
                text: StringManager.choosePayment.tr(),
                fontWeight: FontWeight.w700,
                fontSize: AppSize.defaultSize! * 1.6,
              ),
            ),
            // SizedBox(height: AppSize.defaultSize!*2.8,),
            RadioListTile(
                value: 1,
                groupValue: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'PayPal',
                      fontWeight: FontWeight.w600,
                      fontSize: AppSize.defaultSize! * 1.6,
                    ),
                    // SizedBox(
                    //   height: AppSize.defaultSize!,
                    // ),
                    CustomText(
                      text: 'example@gmail.com',
                      fontWeight: FontWeight.w400,
                      fontSize: AppSize.defaultSize! * 1.2,
                    ),
                  ],
                )),
            SizedBox(height: AppSize.defaultSize!*2.5,),
            RadioListTile(
                value: 2,
                groupValue: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'PayPal',
                      fontWeight: FontWeight.w600,
                      fontSize: AppSize.defaultSize! * 1.6,
                    ),
                    // SizedBox(
                    //   height: AppSize.defaultSize!,
                    // ),
                    CustomText(
                      text: 'example@gmail.com',
                      fontWeight: FontWeight.w400,
                      fontSize: AppSize.defaultSize! * 1.2,
                    ),
                  ],
                )),
            SizedBox(height: AppSize.defaultSize!*2.5,),
            RadioListTile(
                value: 3,
                groupValue: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'PayPal',
                      fontWeight: FontWeight.w600,
                      fontSize: AppSize.defaultSize! * 1.6,
                    ),
                    // SizedBox(
                    //   height: AppSize.defaultSize!,
                    // ),
                    CustomText(
                      text: 'example@gmail.com',
                      fontWeight: FontWeight.w400,
                      fontSize: AppSize.defaultSize! * 1.2,
                    ),
                  ],
                )),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: MainButton(text: '${StringManager.pay.tr()}  200 EGP',

              ),
            ),
            SizedBox(height: AppSize.defaultSize!*2.5,),
          ],
        ),
      ),
    );
  }
}
