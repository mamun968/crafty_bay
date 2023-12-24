import 'package:flutter/material.dart';

import '../../data/model/catagory_data.dart';
import '../utility/app_colors.dart';

class CategoryCard extends StatefulWidget {
  final CategoryData categoryData;
  final VoidCallback onTap;
  const CategoryCard({
    super.key,
    required this.categoryData,
    required this.onTap,
  });

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Container(
              height: 60,
              width: 60,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8)),
              child: Image.network(
                widget.categoryData.categoryImg ?? '',
                height: 60,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              widget.categoryData.categoryName ?? '',
              style: const TextStyle(
                  fontSize: 15,
                  color: AppColors.primaryColor,
                  letterSpacing: 0.4),
            )
          ],
        ),
      ),
    );
  }
}
