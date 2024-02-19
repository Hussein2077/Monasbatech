import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monasbatek/core/resource_manager/asset_path.dart';
import 'package:monasbatek/core/resource_manager/colors.dart';
import 'package:monasbatek/core/widgets/custom_bottom_sheet.dart';
import 'package:monasbatek/core/widgets/empty_widget.dart';
import 'package:monasbatek/core/widgets/loading_widget.dart';
import 'package:monasbatek/features/home/data/models/categoty_model.dart';
import 'package:monasbatek/features/home/presentation/bloc/category_bloc/get_category_bloc.dart';
import 'package:monasbatek/features/home/presentation/bloc/category_bloc/get_category_event.dart';
import 'package:monasbatek/features/home/presentation/bloc/category_bloc/get_category_state.dart';
import 'package:monasbatek/features/home/presentation/pages/sub_category_screen.dart';
import 'package:monasbatek/features/home/presentation/widgets/custom_bottom_navigation.dart';
import 'package:monasbatek/features/search/presentation/pages/search_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../../core/resource_manager/routes.dart';
import '../../../../core/resource_manager/string_manager.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/widgets/custom_search_field.dart';
import '../widgets/custom_gridview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel>? tempData;

  int isFirst = 0;

  @override
  void initState() {
    BlocProvider.of<CategoriesBloc>(context).add(const GetCategoriesEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppSize().init(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: AppSize.defaultSize! * 1.6,
              right: AppSize.defaultSize! * 2.4,
              left: AppSize.defaultSize! * 2.4,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(AppSize.defaultSize! * 4),
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            maxRadius: AppSize.defaultSize! * 2.5,
                            child: Image.asset(AssetPath.profile),
                          )  .animate()
                              .fadeIn() // uses `Animate.defaultDuration`
                              .scale() // inherits duration from fadeIn
                              .move(delay: 300.ms, duration: 800.ms),
                        ),
                        SizedBox(
                          width: AppSize.defaultSize! * 1,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              StringManager.hello.tr(),
                              style: TextStyle(
                                  fontSize: AppSize.defaultSize! * 1.5),
                            ),
                            Text(
                              StringManager.profileName.tr(),
                              style: TextStyle(
                                  fontSize: AppSize.defaultSize! * 1.8,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(AppSize.defaultSize! * 1.7),
                          border: Border.all(color: AppColors.pink)),
                      width: AppSize.screenWidth! * 0.115,
                      height: AppSize.screenHeight! * 0.055,
                      child: Center(
                        child: SvgPicture.asset(AssetPath.notification),
                      ),
                    ),
                  ],
                ),
                //------------- add search text field ------------
                SizedBox(
                  height: AppSize.defaultSize! * 1.2,
                ),
                CustomSearchField(
                  readOnly: true,
                  onTap: () {
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: SearchScreen(),
                      withNavBar: false,
                      // OPTIONAL VALUE. True by default.
                      pageTransitionAnimation:
                          PageTransitionAnimation.fade,
                    );
                  },
                  labelText: StringManager.search,
                  prefixIcon: SvgPicture.asset(AssetPath.searchPrefixIcon),
                  suffixIcon: SvgPicture.asset(AssetPath.searchSuffixIcon),
                ),
                //--------- add home page banner --------------
                Center(
                  child: SizedBox(
                    child: Image.asset(AssetPath.homeBanner),
                  ),
                ),
                //--------------- Add title for GridgView-----
                SizedBox(
                  height: AppSize.defaultSize! * 1.2,
                ),
                Text(
                  StringManager.askOccasion.tr(),
                  style: TextStyle(
                    fontSize: AppSize.defaultSize! * 2,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                )  .animate()
                    .fadeIn() // uses `Animate.defaultDuration`
                    .scale() // inherits duration from fadeIn
                    .move(delay: 300.ms, duration: 800.ms),
                //--------------- AddGridgView-----
                SizedBox(
                  height: AppSize.defaultSize! * 1.2,
                ),
                BlocBuilder<CategoriesBloc, CategoriesState>(
                  builder: (context, state) {
                    if (state is CategoriesSuccessMessageState) {
                      log('${state.categories} state.categories');
                      isFirst++;
                      tempData = state.categories;
                      return state.categories.isEmpty
                          ? const EmptyWidget()
                          : GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: state.categories.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: AppSize.defaultSize! * 0.1,
                                crossAxisSpacing: AppSize.defaultSize! * 1.5,
                                mainAxisSpacing: AppSize.defaultSize! * 1.5,
                              ),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    PersistentNavBarNavigator.pushNewScreen(
                                      context,
                                      screen: SubCategoryScreen(
                                          categoryID: state.categories[index].id
                                              .toString()),
                                      withNavBar: false,
                                      // OPTIONAL VALUE. True by default.
                                      pageTransitionAnimation:
                                          PageTransitionAnimation.cupertino,
                                    );
                                  },
                                  child: CustomGridViewCard(
                                    categoryModel: state.categories[index],
                                  ).animate().fade().scale(),
                                );
                              },
                            );
                    }
                    else if (state is CategoriesErrorMessageState) {
                      return ErrorWidget(state.errorMessage);
                    } else if (state is CategoriesLoadingState) {
                      if (isFirst == 0) {
                        return const LoadingWidget();
                      } else {
                        return GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 6,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: AppSize.defaultSize! * 0.1,
                            crossAxisSpacing: AppSize.defaultSize! * 1.5,
                            mainAxisSpacing: AppSize.defaultSize! * 1.5,
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                PersistentNavBarNavigator.pushNewScreen(
                                  context,
                                  screen: SubCategoryScreen(
                                      categoryID:
                                          tempData![index].id.toString()),
                                  withNavBar: false,
                                  // OPTIONAL VALUE. True by default.
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                );
                              },
                              child: CustomGridViewCard(
                                categoryModel: tempData![index],
                              ),
                            );
                          },
                        );
                      }
                    } else {
                      log('ssss state.categories');
                      return const SizedBox();
                    }
                  },
                ),
                SizedBox(
                  height: AppSize.defaultSize! * 7,
                ),
              ],
            ),
          ),
        ),
      ),
      // -------- add bottom navigation Bar -------
      // bottomNavigationBar: const CustomBottomNavigation(),
    );
  }
}
