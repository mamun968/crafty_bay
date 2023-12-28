import 'package:craftybay_app/data/model/product.dart';
import 'package:craftybay_app/presentstion/utility/app_colors.dart';
import 'package:craftybay_app/presentstion/widget/favourite_button.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../ui/screens/product_details_screen.dart';

class ProductCard extends StatefulWidget {
  final ProductData product;
  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isLoved = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(ProductDetailsScreen(productId: widget.product.id!),
            transition: Transition.cupertinoDialog);
      },
      child: Card(
          shadowColor: AppColors.primaryColor.withOpacity(0.1),
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: SizedBox(
            width: 130,
            child: Column(
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)),
                      color: AppColors.primaryColor.withOpacity(0.3),
                      image: DecorationImage(
                        image: NetworkImage(
                          widget.product.image ?? '',
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    Text(
                      widget.product.title ?? '',
                      maxLines: 1,
                      style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.blueGrey),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${widget.product.price ?? 0}',
                          style: const TextStyle(
                              fontSize: 13,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w500),
                        ),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            const Icon(
                              Icons.star,
                              size: 15,
                              color: Colors.amber,
                            ),
                            Text(
                              '\$${widget.product.star ?? 0}',
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blueGrey),
                            ),
                            const SizedBox(
                              width: 14,
                            ),
                            const FavoriteButton()
                          ],
                        ),
                      ],
                    )
                  ]),
                ),
              ],
            ),
          )),
    );
  }
}
