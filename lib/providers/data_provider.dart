import 'dart:convert';

import 'package:carousel_task/models/first_collection_model.dart';
import 'package:carousel_task/models/second_collection_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../constants/environment.dart';
import '../services/data_services.dart';

class DataProvider extends ChangeNotifier {

  late FirstCollection firstColection;
   SecondCollection? secondColection;
  bool loading = false;
  DataServices services = DataServices();

  getFirstData(context) async {
    loading = true;
    firstColection = await services.loadFirstApi(context);
    loading = false;

    notifyListeners();
  }

  getSecondData(context) async {
    loading = true;
    secondColection = await services.loadSecondApi(context);
    loading = false;

    notifyListeners();
  }

}