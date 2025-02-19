import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_task/components/custom_carousel_slider.dart';
import 'package:carousel_task/models/first_collection_model.dart';
import 'package:carousel_task/providers/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class FirstCarouselView extends StatefulWidget {
  const FirstCarouselView({super.key});

  @override
  State<FirstCarouselView> createState() => _FirstCarouselViewState();
}

class _FirstCarouselViewState extends State<FirstCarouselView> {
  FirstCollection? collection;

  int activeIndex = 0;
  final controller = CarouselSliderController();

  @override
  void initState() {
    Provider.of<DataProvider>(context, listen: false).getFirstData(context);
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
