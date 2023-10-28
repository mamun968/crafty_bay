import 'package:craftybay_app/presentstion/ui/screens/review_screen.dart';
import 'package:craftybay_app/presentstion/widget/custom_stepper.dart';
import 'package:craftybay_app/presentstion/widget/favourite_button.dart';
import 'package:craftybay_app/presentstion/widget/product_details_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utility/app_colors.dart';
import '../../widget/color_picker.dart';
import '../../widget/size_picker.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  List<Color> colors = [
    Colors.deepOrange,
    Colors.amber,
    Colors.blue,
    Colors.yellow,
    Colors.pink,
    Colors.black,
  ];

  int _selectedColorIndex = 0;
  final int _selectedSizeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    const ProductDetailsSlider(),
                    productDetailsAppBar
                  ],
                ),
                productDetails,
              ],
            ),
          ),
        ),
        addPriceCart,
      ],
    )));
  }

  AppBar get productDetailsAppBar {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Text(
        "Product Details",
        style: TextStyle(color: Colors.black26),
      ),
      leading: const BackButton(
        color: Colors.black54,
      ),
    );
  }

  Padding get productDetails {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            const Expanded(
              child: Text("Adidas Originals NMD_R1 Men Shoes",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5)),
            ),
            CustomStepper(
                lowerLimit: 1,
                upperLimit: 15,
                stepValue: 1,
                value: 1,
                onChange: (int value) {
                  value++;
                })
          ]),
          Row(children: [
            const Wrap(children: [
              Icon(
                Icons.star,
                size: 18,
                color: Colors.amber,
              ),
              Text(
                '4.5',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueGrey),
              ),
            ]),
            TextButton(
              onPressed: () {
                Get.to(const ReviewScreen());
              },
              child: const Text(
                'Review',
                style: TextStyle(
                    fontSize: 15,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const Card(color: AppColors.primaryColor, child: FavoriteButton())
          ]),
          const Text(
            'Color',
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
              height: 28,
              child: ColorPicker(
                  colors: colors,
                  selectedColorIndex: _selectedColorIndex,
                  onColorSelected: (int index) {
                    _selectedColorIndex = index;
                    setState(() {});
                  })),
          const SizedBox(
            height: 16,
          ),
          const Text("Size",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              )),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
              height: 28,
              child: SizePicker(
                selectedSizeIndex: _selectedSizeIndex,
                sizes: const ["S", "M", "L", "XL", "XXL", "XXXL"],
              )),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Description',
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
              "'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo "),
        ],
      ),
    );
  }

  Container get addPriceCart {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.1),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Price',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black54),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                '\$1000',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: AppColors.primaryColor),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              'Add To Cart',
            ),
          )
        ],
      ),
    );
  }
}
