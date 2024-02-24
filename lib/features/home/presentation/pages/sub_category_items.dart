import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monasbatek/core/widgets/custom_items_decoration.dart';
import 'package:monasbatek/core/widgets/loading_widget.dart';
import 'package:monasbatek/features/home/presentation/bloc/get_items_bloc/get_items_bloc.dart';
import 'package:monasbatek/features/home/presentation/bloc/get_items_bloc/get_items_event.dart';
import 'package:monasbatek/features/home/presentation/bloc/get_items_bloc/get_items_state.dart';

import '../../../../core/resource_manager/asset_path.dart';
import '../../../../core/resource_manager/colors.dart';
import '../../../../core/resource_manager/routes.dart';
import '../../../../core/resource_manager/string_manager.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/widgets/custom_search_field.dart';

class SubCategoryItems extends StatefulWidget {
  const SubCategoryItems({super.key, required this.id});

  final String id;

  @override
  State<SubCategoryItems> createState() => _SubCategoryItemsState();
}

class _SubCategoryItemsState extends State<SubCategoryItems> {
  @override
  void initState() {
    BlocProvider.of<ItemsBloc>(context).add(GetItemsEvent(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppSize().init(context);

    return SafeArea(
      child: BlocBuilder<ItemsBloc, ItemsState>(
        builder: (context, state) {
          if (state is ItemsSuccessMessageState) {
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text(
                  StringManager.cake.tr(),
                  style: TextStyle(fontSize: AppSize.defaultSize! * 2.5),
                ),
                backgroundColor: AppColors.backGroundColor,
                leading: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      height: AppSize.screenHeight! * 0.5,
                      width: AppSize.screenWidth! * 0.5,
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
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: AppSize.defaultSize! * 0.5,
                      ),
                      //------------- add search text field ------------
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: CustomSearchField(
                          labelText: StringManager.search.tr(),
                          prefixIcon:
                              SvgPicture.asset(AssetPath.searchPrefixIcon),
                          suffixIcon:
                              SvgPicture.asset(AssetPath.searchSuffixIcon),
                        ),
                      ),
                      SizedBox(
                        height: AppSize.defaultSize! * 1.2,
                      ),
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.items.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: AppSize.defaultSize! * 0.075,
                          crossAxisSpacing: AppSize.defaultSize! * 2.5,
                          mainAxisSpacing: AppSize.defaultSize! * 1.8,
                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () => Navigator.of(context).pushNamed(
                                Routes.productDetails,
                                arguments: state.items[index]),
                            child: CustomItemsDecoration(
                              favouriteFunction: () {},
                              imagePath: state.items[index].imagePath!,
                              companyImg:
                                  state.items[index].provider?.profileImage ??
                                      "",
                              companyName:
                                  state.items[index].provider?.name ?? "",
                              productName: state.items[index].name ?? "",
                              productPrice: state.items[index].price.toString(),
                            ).animate().fade().scale(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (state is ItemsErrorMessageState) {
            return ErrorWidget(state.errorMessage);
          } else if (state is ItemsLoadingState) {
            return const LoadingWidget();
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
