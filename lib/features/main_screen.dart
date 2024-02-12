import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monasbatek/core/resource_manager/asset_path.dart';
import 'package:monasbatek/core/resource_manager/colors.dart';
import 'package:monasbatek/core/utils/app_size.dart';
import 'package:monasbatek/core/widgets/cutom_text.dart';
import 'package:monasbatek/features/cart/presentation/cart_screen.dart';
import 'package:monasbatek/features/home/presentation/pages/home_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  static int mainIndex = 0;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PersistentTabController _controller;

  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const CartScreen(),
      const  SizedBox(),
      const  SizedBox(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: iconsColumn(icon: AssetPath.home, text: 'Home', active: true),
        inactiveIcon:
            iconsColumn(icon: AssetPath.home, text: 'Home', active: false),
      ),
      PersistentBottomNavBarItem(
        icon: iconsColumn(icon: AssetPath.cart, text: 'Cart', active: true),
        inactiveIcon:
            iconsColumn(icon: AssetPath.cart, text: 'Cart', active: false),
        onPressed: (context){
          PersistentNavBarNavigator.pushNewScreen(
            context!,
            screen: const CartScreen(),
            withNavBar: false,
            // OPTIONAL VALUE. True by default.
            pageTransitionAnimation:
            PageTransitionAnimation.fade,
          );
        }
      ),
      PersistentBottomNavBarItem(
        icon:
            iconsColumn(icon: AssetPath.chat, text: 'Message', active: true),
        inactiveIcon: iconsColumn(
            icon: AssetPath.chat, text: 'Message', active: false),
      ),
      PersistentBottomNavBarItem(
        icon:
            iconsColumn(icon: AssetPath.profileNavigation, text: 'Profile', active: true),
        inactiveIcon: iconsColumn(
            icon: AssetPath.profileNavigation, text: 'Profile', active: false),
      ),
    ];
  }

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: MainScreen.mainIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        navBarHeight: AppSize.defaultSize! * 10,
        backgroundColor: Colors.white,
        // Default is Colors.white.
        handleAndroidBackButtonPress: true,
        // Default is true.
        resizeToAvoidBottomInset: true,
        // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true,
        // Default is true.
        hideNavigationBarWhenKeyboardShows: true,
        // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.elliptical(
                AppSize.defaultSize! * 40, AppSize.defaultSize! * 5),
            topLeft: Radius.elliptical(
                AppSize.defaultSize! * 40, AppSize.defaultSize! * 5),
            bottomLeft: Radius.circular(AppSize.defaultSize! * 2),
            bottomRight: Radius.circular(AppSize.defaultSize! * 2),
          ),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.slowMiddle,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.bounceInOut,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style6, // Choose the nav bar style with this property.
      ),
    );
  }

  iconsColumn(
      {required String icon, required String text, required bool active}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          icon,
          color: active ? AppColors.primaryColor : AppColors.greyColor,
          width: AppSize.defaultSize! * 2.5,
          height: AppSize.defaultSize! * 2.5,
        ),
        CustomText(
          text: text,
          fontSize: AppSize.defaultSize! * 1.2,
          fontWeight: FontWeight.w700,
          color: active ? AppColors.primaryColor : AppColors.greyColor,
        ),
      ],
    );
  }
}
