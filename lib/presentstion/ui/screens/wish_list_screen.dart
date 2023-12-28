import 'package:craftybay_app/presentstion/state_holders/popular_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holders/bottom_nav_controller.dart';
import '../../widget/product_card.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.find<BottomNavScreenController>().backToHome();
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text(
              'Wishlist',
              style: TextStyle(color: Colors.black),
            ),
            elevation: 0,
            leading: const BackButton(
              color: Colors.black,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 6),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                ),
                itemCount: Get.find<PopularProductController>()
                    .popularProductModel
                    .data!
                    .length,
                itemBuilder: (context, index) {
                  return FittedBox(
                    child: ProductCard(
                        product: Get.find<PopularProductController>()
                            .popularProductModel
                            .data![index]),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
