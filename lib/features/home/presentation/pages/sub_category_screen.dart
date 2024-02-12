import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:monasbatek/core/widgets/empty_widget.dart';
import 'package:monasbatek/core/widgets/loading_widget.dart';
import 'package:monasbatek/features/home/data/models/categoty_model.dart';
import 'package:monasbatek/features/home/presentation/bloc/category_bloc/get_category_bloc.dart';
import 'package:monasbatek/features/home/presentation/bloc/category_bloc/get_category_event.dart';
import 'package:monasbatek/features/home/presentation/bloc/category_bloc/get_category_state.dart';
import 'package:monasbatek/features/home/presentation/bloc/sub_category_bloc/get_category_bloc.dart';
import 'package:monasbatek/features/home/presentation/bloc/sub_category_bloc/get_category_event.dart';
import 'package:monasbatek/features/home/presentation/bloc/sub_category_bloc/get_category_state.dart';

import '../../../../core/resource_manager/asset_path.dart';
import '../../../../core/resource_manager/colors.dart';
import '../../../../core/resource_manager/routes.dart';
import '../../../../core/resource_manager/string_manager.dart';
import '../../../../core/utils/app_size.dart';
import '../widgets/custom_gridview.dart';

class SubCategoryScreen extends StatefulWidget {
  const SubCategoryScreen({super.key, required this.categoryID});

  final String categoryID;

  @override
  State<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  @override
  void initState() {
    BlocProvider.of<SubCategoriesBloc>(context)
        .add(GetSubCategoriesEvent(categoryID: widget.categoryID));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppSize().init(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            StringManager.partyName.tr(),
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
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //----- Add sub category message ---------
                Text(
                  StringManager.happyBirth,
                  style: TextStyle(
                    fontSize: AppSize.defaultSize! * 2,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //--------------- sub category grid view ------
                SizedBox(
                  height: AppSize.defaultSize! * 1.2,
                ),
                BlocBuilder<SubCategoriesBloc, SubCategoriesState>(
                  builder: (context, state) {
                    if (state is GetSubCategoriesSuccessMessageState) {
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
                                  onTap: () => Navigator.of(context)
                                      .pushNamed(Routes.subCategoryItems),
                                  child: CustomGridViewCard(
                                      categoryModel: state.categories[index]),
                                );
                              },
                            );
                    } else if (state is GetSubCategoriesErrorMessageState) {
                      return ErrorWidget(state.errorMessage);
                    } else if (state is GetSubCategoriesLoadingState) {
                      return const LoadingWidget();
                    } else {
                      return const SizedBox();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
