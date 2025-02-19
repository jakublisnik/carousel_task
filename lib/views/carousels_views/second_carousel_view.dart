import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_task/components/custom_carousel_slider.dart';
import 'package:carousel_task/models/first_collection_model.dart';
import 'package:carousel_task/providers/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/second_collection_model.dart';

class SecondCarouselView extends StatefulWidget {
  const SecondCarouselView({super.key});

  @override
  State<SecondCarouselView> createState() => _SecondCarouselViewState();
}

class _SecondCarouselViewState extends State<SecondCarouselView> {
  FirstCollection? collection;
  SecondCollection? collectionSec;
  int activeIndex = 0;
  final controller = CarouselSliderController();

  @override
  void initState() {
    Provider.of<DataProvider>(context, listen: false).getSecondData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loadedData = Provider.of<DataProvider>(context);
    return Scaffold(
        body: Container(
            child: loadedData.loading == true
                ? const Center(
              child: CircularProgressIndicator(),
            )
                : Center(
              child: Column(
                children: [
                  CustomCarouselSlider(
                    loadedData: loadedData.secondColection!.data!
                        .map((e) => e.story!.item!.coverSrc!)
                        .toList(),
                    controller: controller,
                    isStoryStyle: true,
                  ),
                ],
              ),
            )));
  }
}
