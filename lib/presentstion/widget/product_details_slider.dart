import 'package:carousel_slider/carousel_slider.dart';
import 'package:craftybay_app/presentstion/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailsSlider extends StatefulWidget {
  final List<String> imageList;

  const ProductDetailsSlider({super.key, required this.imageList});

  @override
  State<ProductDetailsSlider> createState() => _ProductDetailsSliderState();
}

class _ProductDetailsSliderState extends State<ProductDetailsSlider> {
  int activeSlider = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CarouselSlider(
        options: CarouselOptions(
          height: 270,
          autoPlay: false,
          autoPlayInterval: const Duration(seconds: 3),
          viewportFraction: 1,
          onPageChanged: (index, reason) => setState(() {
            activeSlider = index;
          }),
        ),
        items: widget.imageList.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 2.0),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.05),
                    image: DecorationImage(
                      image: NetworkImage(i),
                    )),
              );
            },
          );
        }).toList(),
      ),
      Padding(
        padding: const EdgeInsets.only(
          top: 250,
          left: 150,
        ),
        child: AnimatedSmoothIndicator(
          activeIndex: activeSlider,
          count: widget.imageList.length,
          onDotClicked: (index) {
            setState(() {
              activeSlider = index;
            });
          },
        ),
      ),
    ]);
  }
}
