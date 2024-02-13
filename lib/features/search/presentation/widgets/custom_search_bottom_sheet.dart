import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:monasbatek/core/resource_manager/colors.dart';
import 'package:monasbatek/core/resource_manager/string_manager.dart';
import 'package:monasbatek/core/utils/app_size.dart';
import 'package:monasbatek/core/widgets/cutom_text.dart';
import 'package:monasbatek/core/widgets/main_button.dart';
import 'package:monasbatek/features/search/presentation/pages/show_items.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class CustomSearchBottomSheet extends StatefulWidget {
  const CustomSearchBottomSheet({super.key});

  @override
  State<CustomSearchBottomSheet> createState() =>
      _CustomSearchBottomSheetState();
}

class _CustomSearchBottomSheetState extends State<CustomSearchBottomSheet> {
  double _value = 400.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: AppSize.defaultSize! * 1.5, right: AppSize.defaultSize! * 1.5),
      child: Column(
        children: [
          Row(
            children: [
              CustomText(
                text: StringManager.filterBy.tr(),
                color: AppColors.black,
                fontSize: AppSize.defaultSize! * 1.5,
                fontWeight: FontWeight.w700,
                height: 0.11,
              ),
            ],
          ),
          // Choose filter methode
          SizedBox(
            height: AppSize.screenHeight! * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: AppSize.screenWidth! * 0.4,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.white,
                  ),
                  child: CheckboxListTile(
                    value: true,
                    onChanged: (value) {},
                    title: Text("Products"),
                  ),
                ),
              ),
              SizedBox(
                width: AppSize.screenWidth! * 0.4,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.white,
                  ),
                  child: CheckboxListTile(
                    value: false,
                    onChanged: (value) {},
                    title: Text("Providers"),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: AppSize.screenHeight! * 0.01,
          ),
          // show price slider change
          Row(
            children: [
              CustomText(
                text: StringManager.priceTitle.tr(),
                color: AppColors.black,
                fontSize: AppSize.defaultSize! * 1.5,
                fontWeight: FontWeight.w700,
                height: 0.11,
              ),
            ],
          ),
          SfSlider(
            min: 0.0,
            max: 1000.0,
            value: _value,
            interval: 250,
            showTicks: true,
            showLabels: true,
            enableTooltip: true,
            minorTicksPerInterval: 1,
            labelPlacement: LabelPlacement.betweenTicks,
            edgeLabelPlacement: EdgeLabelPlacement.auto,
            onChanged: (dynamic value) {
              setState(() {
                _value = value;
              });
            },
          ),
          SizedBox(
            height: AppSize.screenHeight! * 0.01,
          ),
          SizedBox(
            height: AppSize.screenHeight! * 0.01,
          ),
          // add apply Main Color
          MainButton(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ShowItems(),
              ),
            ),
            text: StringManager.apply,
          ),
        ],
      ),
    );
  }
}
