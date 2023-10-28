import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailsSlider extends StatefulWidget {
  const ProductDetailsSlider({super.key});

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
        items: [1, 2, 3, 4].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 2.0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                ),
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
          count: 4,
          
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
