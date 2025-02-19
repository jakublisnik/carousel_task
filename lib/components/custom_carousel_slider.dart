import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomCarouselSlider extends StatefulWidget {
  final List<String> loadedData;
  final CarouselSliderController controller;

  const CustomCarouselSlider(
      {super.key, required this.loadedData, required this.controller});

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  int activeIndex = 0;
  final CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: widget.controller,
          options: CarouselOptions(
            height: 500,
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            autoPlayInterval: const Duration(seconds: 3),
            onPageChanged: (index, reason) => setState(() {
              activeIndex = index;
            }),
          ),
          itemCount: widget.loadedData.length,
          itemBuilder: (context, index, realIndex) {
            return buildImage(widget.loadedData[index]);
          },
        ),
        const SizedBox(
          height: 32,
        ),
        buildIndicator(),
        const SizedBox(
          height: 32,
        ),
        buildButtons(),
      ],
    );
  }

  Widget buildImage(String imageUrl) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      color: Colors.grey,
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: widget.loadedData.length,
        onDotClicked: animateToSlide,
      );

  void animateToSlide(int index) => widget.controller.animateToPage(index);

  Widget buildButtons() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => widget.controller.previousPage(),
            child: const Text('Previous'),
          ),
          const SizedBox(width: 12),
          ElevatedButton(
            onPressed: () => widget.controller.nextPage(),
            child: const Text('Next'),
          ),
        ],
      );
}