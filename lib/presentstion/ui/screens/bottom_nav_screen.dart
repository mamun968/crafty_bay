import 'package:craftybay_app/presentstion/state_holders/bottom_nav_controller.dart';
import 'package:craftybay_app/presentstion/ui/screens/catagories_screen.dart';
import 'package:craftybay_app/presentstion/ui/screens/cart_screen.dart';
import 'package:craftybay_app/presentstion/ui/screens/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holders/catagory_controller.dart';
import '../../state_holders/home_slider_controller.dart';
import '../../utility/app_colors.dart';
import 'home_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  static final GlobalKey<BottomNavScreenState> navKey =
      GlobalKey<BottomNavScreenState>();
  @override
  State<BottomNavScreen> createState() => BottomNavScreenState();
}

class BottomNavScreenState extends State<BottomNavScreen> {
  final List<Widget> _screens = const [
    HomeScreen(),
    CatagoriesScreen(),
    CartScreen(),
    WishListScreen(),
  ];
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<HomeSlidersController>().getHomeSliders();
      Get.find<CategoryController>().getCategories();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavScreenController>(builder: (controller) {
      return Scaffold(
        body: _screens[controller.currentSelectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentSelectedIndex,
          onTap: controller.changeScreen,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          elevation: 4,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_filled,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.dashboard,
                ),
                label: 'Categories'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                ),
                label: 'Cart'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_border,
                ),
                label: 'Wishlist'),
          ],
        ),
      );
    });
  }
}
