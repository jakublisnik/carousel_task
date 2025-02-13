import 'package:carousel_task/models/first_collection_model.dart';
import 'package:carousel_task/providers/data_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstCarouselView extends StatefulWidget {
  const FirstCarouselView({super.key});

  @override
  State<FirstCarouselView> createState() => _FirstCarouselViewState();
}

class _FirstCarouselViewState extends State<FirstCarouselView> {
  FirstCollection? collection;
  @override
  Widget build(BuildContext context) {
    Provider.of<DataProvider>(context, listen: false).loadFirstApi();
    collection = Provider.of<DataProvider>(context, listen: false).collection;

    return Scaffold(
        appBar: AppBar(
          title: Text("First CAROUSEL"),
        ),
        body: Column(children: [
          Text(collection!.data![0].coverImageUrl!),
          Text(collection!.data![1].coverImageUrl!),
          Text(collection!.data![2].coverImageUrl!),
          Text(collection!.data![3].coverImageUrl!),
          Text(collection!.data![4].coverImageUrl!),
          Text(collection!.data!.length.toString()),

        ],));
  }
}
