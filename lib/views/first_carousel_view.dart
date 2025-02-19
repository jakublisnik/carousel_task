import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_task/components/custom_carousel_slider.dart';
import 'package:carousel_task/models/first_collection_model.dart';
import 'package:carousel_task/providers/data_provider.dart';
import 'package:carousel_task/services/data_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/second_collection_model.dart';

class FirstCarouselView extends StatefulWidget {
  const FirstCarouselView({super.key});

  @override
  State<FirstCarouselView> createState() => _FirstCarouselViewState();
}

class _FirstCarouselViewState extends State<FirstCarouselView> {
  FirstCollection? collection;
  SecondCollection? collectionSec;
  int activeIndex = 0;
  final controller = CarouselSliderController();

  @override
  void initState() {
    Provider.of<DataProvider>(context, listen: false).getFirstData(context);
    Provider.of<DataProvider>(context, listen: false).getSecondData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loadedData = Provider.of<DataProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("First CAROUSEL"),
          backgroundColor: Colors.grey,
        ),
        body: Container(
            child: loadedData.loading == true
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Center(
                    child: Column(
                      children: [
                        CustomCarouselSlider(
                          loadedData: loadedData.firstColection.data!
                              .map((e) => e.coverImageUrl!)
                              .toList(),
                          controller: controller,
                        ),
                      ],
                    ),
                  )));
  }
}
