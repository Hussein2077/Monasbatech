// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:monasbatek/core/resource_manager/routes.dart';
// import 'package:monasbatek/core/resource_manager/string_manager.dart';
// import 'package:monasbatek/core/utils/app_size.dart';
// import 'package:monasbatek/core/widgets/app_bar.dart';
// import 'package:monasbatek/core/widgets/main_button.dart';
// import 'package:monasbatek/core/widgets/column_with_text_field.dart';
// class ChangePassword extends StatefulWidget {
//   const ChangePassword({super.key});
//
//   @override
//   State<ChangePassword> createState() => _ChangePasswordState();
// }
//
// class _ChangePasswordState extends State<ChangePassword> {
//   late TextEditingController passwordController;
//   late TextEditingController passwordConfirmController;
//   @override
//   void initState() {
//
//     passwordController = TextEditingController();
//     passwordConfirmController = TextEditingController();
//
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//
//     passwordController.dispose();
//     passwordConfirmController.dispose();
//
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: appBar(context,text: StringManager.forgetPassword.tr()),
//       body: Padding(
//         padding: EdgeInsets.all(AppSize.defaultSize! * 2),
//         child: Column(
//           children: [
//             ColumnWithTextField(
//               text: StringManager.password.tr(),
//               controller: passwordController,
//             ),
//             ColumnWithTextField(
//               text: StringManager.confirmPassword.tr(),
//               controller: passwordConfirmController,
//             ),
//             SizedBox(
//               height: AppSize.defaultSize!*4,
//             ),
//               MainButton(text: StringManager.confirm.tr(),onTap: (){
//                 Navigator.pushNamedAndRemoveUntil(context, Routes.login, (Route<dynamic> route) => false) ;
//               },)
//           ],
//         ),
//       ),
//
//     );
//   }
// }
