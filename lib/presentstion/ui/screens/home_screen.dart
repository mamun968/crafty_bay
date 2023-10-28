import 'package:craftybay_app/presentstion/ui/screens/product_list_screen.dart';
import 'package:craftybay_app/presentstion/widget/home_carousel.dart.dart';
import 'package:craftybay_app/presentstion/widget/sectionHeader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../state_holders/bottom_nav_controller.dart';
import '../../widget/appBarIcon.dart';
import '../../widget/catagory_card.dart';
import '../../widget/product_card.dart';

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
                const HomeCarousel(),
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
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) =>
                          const CategoryCard()),
                ),
                SectionHeader(
                    title: 'Popular ',
                    onTap: () {
                      Get.to(const ProductListScreen());
                    }),
                SizedBox(
                    height: 175,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) =>
                          const ProductCard(),
                    )),
                SectionHeader(
                    title: "Special ",
                    onTap: () {
                      Get.to(const ProductListScreen());
                    }),
                SizedBox(
                    height: 175,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) =>
                          const ProductCard(),
                    )),
                SectionHeader(
                    title: 'New Arrivals',
                    onTap: () {
                      Get.to(const ProductListScreen());
                    }),
                SizedBox(
                    height: 175,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) =>
                          const ProductCard(),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
