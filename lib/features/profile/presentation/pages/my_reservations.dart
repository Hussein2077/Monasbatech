import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monasbatek/features/profile/presentation/pages/reservation_status_details.dart';
import 'package:monasbatek/features/profile/presentation/widgets/reservation_status_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../../core/resource_manager/asset_path.dart';
import '../../../../core/resource_manager/colors.dart';
import '../../../../core/resource_manager/string_manager.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/widgets/cutom_text.dart';

class MyReservations extends StatefulWidget {
  const MyReservations({super.key});

  @override
  State<MyReservations> createState() => _MyReservationsState();
}

class _MyReservationsState extends State<MyReservations> {
  int _selectedIndex = 0; // Track the index of the selected tab
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // استخدم jumpToPage بدلاً من animateToPage لتجنب الانتقال السلس
    _pageController.jumpToPage(index);
  }

  Widget _customTab(String title, int index) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onTabTapped(index),
      child: Container(
        padding: EdgeInsets.all(AppSize.defaultSize! * 1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.defaultSize! * 1.5),
          color: isSelected
              ? AppColors.greyColor.withOpacity(0.2)
              : AppColors.white,
        ),
        child: CustomText(
          text: title.tr(),
          color: isSelected
              ? AppColors.primaryColor
              : AppColors.greyColor.withOpacity(0.5),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          StringManager.myReservations.tr(),
          style: TextStyle(fontSize: AppSize.defaultSize! * 2.5),
        ),
        backgroundColor: AppColors.backGroundColor,
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(
                  AssetPath.arrowLeft,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSize.defaultSize! * 1.5),
        child: Column(
          children: [
            // Tabs
            Container(
              padding: EdgeInsets.all(AppSize.defaultSize! * 1),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.defaultSize! * 1),
                  color: AppColors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _customTab(StringManager.progress, 0),
                  _customTab(StringManager.complete, 1),
                  _customTab(StringManager.canceled, 2),
                ],
              ),
            ),
            Expanded(
              // PageView for content
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                children: [
                  //these for progress
                  ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: ReservationStatusDetails(
                                reservationStatusTitle:
                                    StringManager.progressReservationTitle.tr(),
                              ),
                              withNavBar: false,
                              // OPTIONAL VALUE. True by default.
                              pageTransitionAnimation:
                                  PageTransitionAnimation.fade,
                            );
                          },
                          child: ReservationStatusWidget(
                            reservationAddress: StringManager.jeddahName.tr(),
                            reservationCompanyImg:
                                AssetPath.reservationCompanyImg,
                            reservationCompanyTitle:
                                StringManager.trendCafe.tr(),
                            reservationDate: StringManager.reservationDate.tr(),
                            reservationStatus:
                                StringManager.progressReservation.tr(),
                          ),
                        );
                      }),
                  //these for complete

                  ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: ReservationStatusDetails(
                                reservationStatusTitle:
                                    StringManager.completeReservation.tr(),
                              ),
                              withNavBar: false,
                              // OPTIONAL VALUE. True by default.
                              pageTransitionAnimation:
                                  PageTransitionAnimation.fade,
                            );
                          },
                          child: ReservationStatusWidget(
                            reservationAddress: StringManager.jeddahName.tr(),
                            reservationCompanyImg:
                                AssetPath.reservationCompanyImg,
                            reservationCompanyTitle:
                                StringManager.trendCafe.tr(),
                            reservationDate: StringManager.reservationDate.tr(),
                            reservationStatus:
                                StringManager.againReservation.tr(),
                          ),
                        );
                      }),
                  //these for cancel

                  ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: ReservationStatusDetails(
                                reservationStatusTitle:
                                    StringManager.reservationCanceled.tr(),
                              ),
                              withNavBar: false,
                              // OPTIONAL VALUE. True by default.
                              pageTransitionAnimation:
                                  PageTransitionAnimation.fade,
                            );
                          },
                          child: ReservationStatusWidget(
                            reservationAddress: StringManager.jeddahName.tr(),
                            reservationCompanyImg:
                                AssetPath.reservationCompanyImg,
                            reservationCompanyTitle:
                                StringManager.trendCafe.tr(),
                            reservationDate: StringManager.reservationDate.tr(),
                            reservationStatus:
                                StringManager.againReservation.tr(),
                          ),
                        );
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
