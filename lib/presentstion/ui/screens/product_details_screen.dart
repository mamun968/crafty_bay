import 'package:craftybay_app/presentstion/ui/screens/review_screen.dart';
import 'package:craftybay_app/presentstion/widget/custom_stepper.dart';
import 'package:craftybay_app/presentstion/widget/favourite_button.dart';
import 'package:craftybay_app/presentstion/widget/product_details_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/product_details.dart';
import '../../state_holders/add_to_cart_controller.dart';
import '../../state_holders/product_details_controller.dart';
import '../../utility/app_colors.dart';
import '../../utility/color_extension.dart';
import '../../widget/color_picker.dart';
import '../../widget/size_picker.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int productId;
  const ProductDetailsScreen({super.key, required this.productId});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _selectedColorIndex = 0;
  int _selectedSizeIndex = 0;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ProductDetailsController>().getProductDetails(widget.productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<ProductDetailsController>(
        builder: (productDetailsController) {
      if (productDetailsController.getProductDetailsInProgress) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return SafeArea(
          child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        ProductDetailsSlider(
                          imageList: [
                            productDetailsController.productDetails.img1 ?? '',
                            productDetailsController.productDetails.img2 ?? '',
                            productDetailsController.productDetails.img3 ?? '',
                            productDetailsController.productDetails.img4 ?? '',
                          ],
                        ),
                        productDetailsAppBar
                      ],
                    ),
                    productDetails(
                      productDetailsController.productDetails,
                      productDetailsController.availableColors,
                    ),
                  ],
                ),
              ),
            ),
          ),
          addToPriceCart(
              productDetailsController.productDetails,
              productDetailsController.availableColors,
              productDetailsController.availableSizes),
        ],
      ));
    }));
  }

  Padding productDetails(ProductDetails productDetails, List<String> colors) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Expanded(
              child: Text(productDetails.product?.title ?? '',
                  style: const TextStyle(
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
            Wrap(crossAxisAlignment: WrapCrossAlignment.center, children: [
              const Icon(
                Icons.star,
                size: 18,
                color: Colors.amber,
              ),
              Text(
                '${productDetails.product?.star ?? 0}',
                style: const TextStyle(
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
                initialSelected: 0,
                onSelected: (int selectedSize) {
                  _selectedSizeIndex = selectedSize;
                },
                sizes: productDetails.size?.split(',') ?? [],
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
          Text(
            productDetails.des ?? '',
          ),
        ],
      ),
    );
  }

  Container addToPriceCart(
      ProductDetails details, List<String> colors, List<String> sizes) {
    return Container(
      height: 85,
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
          GetBuilder<AddToCartController>(builder: (addToCartController) {
            if (addToCartController.isAddToCartInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ElevatedButton(
              onPressed: () async {
                final result = await addToCartController.addToACart(
                    details.id!,
                    colors[_selectedColorIndex].toString(),
                    sizes[_selectedSizeIndex]);
                if (result) {
                  Get.snackbar(
                    "Success",
                    'Added to cart successfully',
                    snackPosition: SnackPosition.TOP,
                  );
                } else {
                  Get.snackbar(
                    addToCartController.message,
                    "",
                    snackPosition: SnackPosition.TOP,
                  );
                }
              },
              child: const Text(
                'Add To Cart',
              ),
            );
          })
        ],
      ),
    );
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
}
