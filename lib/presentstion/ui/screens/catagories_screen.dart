import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holders/bottom_nav_controller.dart';
import '../../widget/catagory_card.dart';

class CatagoriesScreen extends StatelessWidget {
  const CatagoriesScreen({super.key});

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
                'Categories',
                style: TextStyle(color: Colors.black),
              ),
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Get.find<BottomNavScreenController>().backToHome();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black54,
                ),
              ),
            ),
            body: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 7),
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemBuilder: (context, index) {
                      return const FittedBox(
                        child: CategoryCard(),
                      );
                    }))),
      ),
    );
  }
}
