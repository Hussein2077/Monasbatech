import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monasbatek/core/resource_manager/colors.dart';
import 'package:monasbatek/core/utils/app_size.dart';
import 'package:monasbatek/core/widgets/cutom_text.dart';
import 'package:monasbatek/features/profile/presentation/pages/edit_profile.dart';
import 'package:monasbatek/features/profile/presentation/pages/my_orders.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'dart:math' as math;

import '../../../../core/resource_manager/asset_path.dart';
import '../../../../core/resource_manager/string_manager.dart';
import '../widgets/profile_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(AppSize.defaultSize! * 0.8),
            child: Column(
              children: [
                // the container on top
                Container(
                  width: AppSize.screenWidth,
                  height: AppSize.screenHeight! * 0.25,
                  decoration: BoxDecoration(
                      color: AppColors.gridViewContainerColor,
                      borderRadius:
                          BorderRadius.circular(AppSize.defaultSize! * 3)),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Transform.rotate(
                          angle: -math.pi / 4,
                          child: Container(
                            height: AppSize.screenHeight! * 0.1,
                            width: AppSize.screenHeight! * 0.1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  AppSize.defaultSize! * 3),
                              border: Border.all(
                                color: AppColors.primaryColor,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  AppSize.defaultSize! * 4),
                              child: Center(
                                child: Transform.rotate(
                                  angle: math.pi / 4,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        AppSize.defaultSize! * 4),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      maxRadius: AppSize.defaultSize! * 2.5,
                                      child: Image.asset(AssetPath.profile),
                                    )
                                        .animate()
                                        .fadeIn() // uses `Animate.defaultDuration`
                                        .scale() // inherits duration from fadeIn
                                        .move(delay: 300.ms, duration: 800.ms),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: AppSize.screenHeight! * 0.01,
                        ),
                        CustomText(
                          text: StringManager.profileName.tr(),
                          fontWeight: FontWeight.w700,
                          fontSize: AppSize.defaultSize! * 2,
                        ),
                      ],
                    ),
                  ),
                ),
                // create buttons or list tile
                SizedBox(
                  height: AppSize.screenHeight! * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppSize.defaultSize! * 0.08),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: EditProfileScreen(),
                            withNavBar: false,
                            // OPTIONAL VALUE. True by default.
                            pageTransitionAnimation:
                                PageTransitionAnimation.fade,
                          );
                        },
                        child: ProfileButtonWidget(
                            title: StringManager.editPersonalProfile.tr(),
                            prefixIconAssetPath: AssetPath.profileNavigation),
                      ),
                      SizedBox(
                        height: AppSize.screenHeight! * 0.02,
                      ),
                      InkWell(
                        onTap: () {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: MyOrders(),
                            withNavBar: false,
                            // OPTIONAL VALUE. True by default.
                            pageTransitionAnimation:
                                PageTransitionAnimation.fade,
                          );
                        },
                        child: ProfileButtonWidget(
                            title: StringManager.myOrders.tr(),
                            prefixIconAssetPath: AssetPath.myOrders),
                      ),
                      SizedBox(
                        height: AppSize.screenHeight! * 0.02,
                      ),
                      ProfileButtonWidget(
                          title: StringManager.myReservations.tr(),
                          prefixIconAssetPath: AssetPath.myReservations),
                      SizedBox(
                        height: AppSize.screenHeight! * 0.02,
                      ),
                      ProfileButtonWidget(
                          title: StringManager.myAddresses.tr(),
                          prefixIconAssetPath: AssetPath.myAddresses),
                      SizedBox(
                        height: AppSize.screenHeight! * 0.02,
                      ),
                      ProfileButtonWidget(
                          title: StringManager.favourite.tr(),
                          prefixIconAssetPath: AssetPath.heart),
                      SizedBox(
                        height: AppSize.screenHeight! * 0.02,
                      ),
                      ProfileButtonWidget(
                          title: StringManager.paymentMethod.tr(),
                          prefixIconAssetPath: AssetPath.paymentMethod),
                      SizedBox(
                        height: AppSize.screenHeight! * 0.02,
                      ),
                      ProfileButtonWidget(
                          title: StringManager.help.tr(),
                          prefixIconAssetPath: AssetPath.help),
                      SizedBox(
                        height: AppSize.screenHeight! * 0.02,
                      ),
                      ProfileButtonWidget(
                          title: StringManager.inviteFriends.tr(),
                          prefixIconAssetPath: AssetPath.inviteFriends),
                      SizedBox(
                        height: AppSize.screenHeight! * 0.02,
                      ),
                      ProfileButtonWidget(
                          title: StringManager.applicationPolicy.tr(),
                          prefixIconAssetPath: AssetPath.applicationPolicy),
                      SizedBox(
                        height: AppSize.screenHeight! * 0.02,
                      ),
                      ProfileButtonWidget(
                          title: StringManager.settings.tr(),
                          prefixIconAssetPath: AssetPath.settings),
                      SizedBox(
                        height: AppSize.screenHeight! * 0.06,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
