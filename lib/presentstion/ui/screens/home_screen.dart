import 'package:craftybay_app/presentstion/state_holders/catagory_controller.dart';
import 'package:craftybay_app/presentstion/state_holders/home_slider_controller.dart';
import 'package:craftybay_app/presentstion/state_holders/new_product_controller.dart';
import 'package:craftybay_app/presentstion/state_holders/popular_product_controller.dart';
import 'package:craftybay_app/presentstion/state_holders/special_product_controller.dart';
import 'package:craftybay_app/presentstion/ui/screens/product_list_screen.dart';
import 'package:craftybay_app/presentstion/widget/home_carousel.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../state_holders/bottom_nav_controller.dart';
import '../../widget/app_bar_icon.dart';
import '../../widget/catagory_card.dart';
import '../../widget/product_card.dart';
import '../../widget/section_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: SvgPicture.asset(
            "assets/images/logo_nav.svg",
          ),
          actions: [
            AppBarIcon(
              icon: Icons.person,
              onTap: () {},
            ),
            AppBarIcon(
              icon: Icons.call,
              onTap: () {},
            ),
            AppBarIcon(
              icon: Icons.notifications_none,
              onTap: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                TextField(
                    decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)),
                  hintText: "Search",
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  prefixIcon: const Icon(Icons.search),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                )),
                const SizedBox(
                  height: 16,
                ),
                GetBuilder<HomeSlidersController>(
                    builder: (homeSliderController) {
                  if (homeSliderController.getHomeSlidersInProgress) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return HomeCarousel(
                    sliders: homeSliderController.sliderModel.data ?? [],
                  );
                }),
                const SizedBox(
                  height: 8,
                ),
                SectionHeader(
                    title: ' All Categories',
                    onTap: () {
                      Get.find<BottomNavScreenController>().changeScreen(1);
                    }),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 100,
                  child: GetBuilder<CategoryController>(
                      builder: (categoryController) {
                    if (categoryController.getCategoriesInProgress) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            categoryController.categoryModel.data?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) =>
                            CategoryCard(
                                onTap: () {
                                  Get.to(ProductListScreen(
                                      categoryId: categoryController
                                          .categoryModel.data![index].id!,
                                      title: categoryController.categoryModel
                                          .data![index].categoryName!));
                                },
                                categoryData: categoryController
                                    .categoryModel.data![index]));
                  }),
                ),
                SectionHeader(
                    title: 'Popular ',
                    onTap: () {
                      Get.to(Get.to(ProductListScreen(
                          productModel: Get.find<PopularProductController>()
                              .popularProductModel,
                          title: "Popular Products")));
                    }),
                GetBuilder<PopularProductController>(
                    builder: (popularProductController) {
                  if (popularProductController.getPopularProductInProgress) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return SizedBox(
                      height: 175,
                      width: double.infinity,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: popularProductController
                                .popularProductModel.data?.length ??
                            0,
                        itemBuilder: (BuildContext context, int index) =>
                            ProductCard(
                                product: popularProductController
                                    .popularProductModel.data![index]),
                      ));
                }),
                SectionHeader(
                    title: "Special ",
                    onTap: () {
                      Get.to((ProductListScreen(
                        productModel: Get.find<SpecialProductController>()
                            .specialProductModel,
                        title: "Special Products",
                      )));
                    }),
                GetBuilder<SpecialProductController>(
                    builder: (specialProductController) {
                  if (specialProductController.getSpecialProductInProgress) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return SizedBox(
                      height: 175,
                      width: double.infinity,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: specialProductController
                                .specialProductModel.data?.length ??
                            0,
                        itemBuilder: (BuildContext context, int index) =>
                            ProductCard(
                                product: specialProductController
                                    .specialProductModel.data![index]),
                      ));
                }),
                SectionHeader(
                    title: 'New Arrivals',
                    onTap: () {
                      Get.to(ProductListScreen(
                        productModel:
                            Get.find<NewProductController>().newProductModel,
                        title: 'New Arrivals',
                      ));
                    }),
                GetBuilder<NewProductController>(
                    builder: (newProductController) {
                  if (newProductController.getNewProductInProgress) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return SizedBox(
                      height: 175,
                      width: double.infinity,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            newProductController.newProductModel.data?.length ??
                                0,
                        itemBuilder: (BuildContext context, int index) =>
                            ProductCard(
                          product:
                              newProductController.newProductModel.data![index],
                        ),
                      ));
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
