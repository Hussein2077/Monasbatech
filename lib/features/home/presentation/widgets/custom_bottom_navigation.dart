import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monasbatek/core/resource_manager/asset_path.dart';
import 'package:monasbatek/core/resource_manager/colors.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0.0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.greyColor,
      selectedFontSize: 14,
      currentIndex: 0,
      unselectedFontSize: 14,
      onTap: (value) {
        // Respond to item press.
      },
      items: [
        BottomNavigationBarItem(
          label: "Home",
          icon: SvgPicture.asset(
            AssetPath.home,
            color: AppColors.primaryColor,
          ),
        ),
        BottomNavigationBarItem(
          label: "Shopping",
          icon: SvgPicture.asset(
            AssetPath.cart,
            color: AppColors.greyColor,
          ),
        ),
        BottomNavigationBarItem(
          label: "Messages",
          icon: SvgPicture.asset(
            AssetPath.chat,
            color: AppColors.greyColor,
          ),
        ),
        BottomNavigationBarItem(
          label: "Profile",
          icon: SvgPicture.asset(
            AssetPath.profileNavigation,
            color: AppColors.greyColor,
          ),
        ),
      ],
    );
  }
}
