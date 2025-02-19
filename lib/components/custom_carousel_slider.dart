import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomCarouselSlider extends StatefulWidget {
  final List<String> loadedData;
  final CarouselSliderController controller;
  final bool isStoryStyle;

  const CustomCarouselSlider({
    super.key,
    required this.loadedData,
    required this.controller,
    this.isStoryStyle = false,
  });

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double carouselHeight = deviceHeight * 0.6;
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: widget.controller,
          options: CarouselOptions(
            height: widget.isStoryStyle ? 220 : carouselHeight,
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
        const SizedBox(height: 24),
        buildIndicator(),
        const SizedBox(height: 24),
        buildButtons(),
      ],
    );
  }

  Widget buildImage(String imageUrl) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: widget.isStoryStyle
          ? ClipOval(
              child: Image.network(
                imageUrl,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            )
          : Container(
              color: Colors.grey,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: widget.loadedData.length,
        onDotClicked: animateToSlide,
        effect: widget.isStoryStyle
            ? const WormEffect(
                dotHeight: 7,
                dotWidth: 7,
                activeDotColor: Colors.blue,
                spacing: 3)
            : const ScrollingDotsEffect(maxVisibleDots: 5),
      );

  void animateToSlide(int index) => widget.controller.animateToPage(index);

  Widget buildButtons() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Semantics(
            label: "Tlačítko pro zobrazení předchozího obrázku",
            child: ElevatedButton(
              onPressed: () => widget.controller.previousPage(),
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(140, 50),
                backgroundColor: Colors.grey[300],
              ),
              child:
                  const Text('Předchozí', style: TextStyle(color: Colors.blue)),
            ),
          ),
          const SizedBox(width: 12),
          Semantics(
            label: "Tlačítko pro zobrazení dalšího obrázku",
            child: ElevatedButton(
              onPressed: () => widget.controller.nextPage(),
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(140, 50),
                backgroundColor: Colors.grey[300],
              ),
              child: const Text('Další', style: TextStyle(color: Colors.blue)),
            ),
          ),
        ],
      );
}
