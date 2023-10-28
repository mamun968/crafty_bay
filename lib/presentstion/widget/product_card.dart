import 'package:craftybay_app/presentstion/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../ui/screens/product_details_screen.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(const ProductDetailsScreen());
      },
      child: Card(
          shadowColor: AppColors.primaryColor.withOpacity(0.1),
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: SizedBox(
            width: 120,
            child: Column(
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)),
                      color: AppColors.primaryColor.withOpacity(0.3),
                      image: const DecorationImage(
                        image: AssetImage(
                          'assets/images/shoe.png',
                        ),
                      )),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(children: [
                    Text(
                      'Nike shoe AK50459049',
                      maxLines: 1,
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.blueGrey),
                    ),
                    SizedBox(height: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '₹ 500',
                          style: TextStyle(
                              fontSize: 13,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w500),
                        ),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              size: 15,
                              color: Colors.amber,
                            ),
                            Text(
                              '4.5',
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blueGrey),
                            ),
                            SizedBox(
                              width: 14,
                            ),
                            Card(
                              color: AppColors.primaryColor,
                              child: Padding(
                                padding: EdgeInsets.all(2.0),
                                child: Icon(
                                  Icons.favorite_border,
                                  size: 12,
                                  color: Colors.white,
                                ),
                              ),
                            )
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
