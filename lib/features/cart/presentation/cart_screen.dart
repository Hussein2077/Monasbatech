import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:monasbatek/core/resource_manager/string_manager.dart';
import 'package:monasbatek/core/widgets/app_bar.dart';
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int? selectedValue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, text: StringManager.cart.tr(),arrowBack: false),
      body: Column(
        children: [
          RadioListTile(
            value: 2,
            groupValue: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
            },
            title: Text('Option 2'),
            activeColor: Colors.blue, // Customize the selected color
          ),
        ],
      ),

    );
  }
}
