import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../utility/app_colors.dart';

class HomeCarousel extends StatefulWidget {
  final List sliders;
  const HomeCarousel({super.key, required this.sliders});

  @override
  State<HomeCarousel> createState() => _ProductCarouselState();
}

class _ProductCarouselState extends State<HomeCarousel> {
  int activeSlider = 0;

  // final ValueNotifier<int> activeSlider = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 170,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            enlargeCenterPage: true,
            viewportFraction: 0.8,
            onPageChanged: (index, reason) => setState(() {
              activeSlider = index;
            }),
          ),
          items: widget.sliders.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 2.0),
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(0.2),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8))),
                    child: Stack(children: [
                      Image.network(i.image ?? ''),
                      Positioned(
                        bottom: 8,
                        right: 20,
                        child: Text(
                          i.title ?? '',
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        ),
                      )
                    ]));
              },
            );
          }).toList(),
        ),
        const SizedBox(
          height: 8,
        ),
        AnimatedSmoothIndicator(
          activeIndex: activeSlider,
          count: 5,
          effect: const ExpandingDotsEffect(
              activeDotColor: AppColors.primaryColor, expansionFactor: 2),
        ),

        // to do it manually
        // ValueListenableBuilder(
        //   valueListenable: activeSlider,
        //   builder: (context, value, _) {
        //     List<Widget> list = [];
        //     for (int i = 0; i < 5; i++) {
        //       list.add(Container(
        //         width: 10,
        //         height: 10,
        //         margin: const EdgeInsets.symmetric(horizontal: 4),
        //         decoration: BoxDecoration(
        //             border: Border.all(color: Colors.grey),
        //             borderRadius: BorderRadius.circular(10),
        //             color: value == i ? AppColors.primaryColor : null),
        //       ));
        //     }
        //     return Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: list,
        //     );
        //   },
        // )
      ],
    );
  }
}
