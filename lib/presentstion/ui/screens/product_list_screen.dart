import 'package:craftybay_app/data/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holders/product_list_controller.dart';
import '../../widget/product_card.dart';

class ProductListScreen extends StatefulWidget {
  final int? categoryId;
  final ProductModel? productModel;
  const ProductListScreen({super.key,  this.categoryId,  this.productModel});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if(widget.categoryId!=null){
        Get.find<ProductListController>()
          .getProductListByCategory(widget.categoryId!);
      }
      else if (widget.productModel!=null) {
        Get.find<ProductListController>()
          .setProducts(widget.productModel!);
      }
      
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Products',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: GetBuilder<ProductListController>(builder: (productListController) {
        if (productListController.getCategoriesInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (productListController.productModel.data!.isEmpty) {
          return const Center(
            child: Text('No product found'),
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: GridView.builder(
              itemCount: productListController.productModel.data?.length ?? 0,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                return FittedBox(
                  child: ProductCard(
                    product: productListController.productModel.data![index],
                  ),
                );
              }),
        );
      }),
    );
  }
}
