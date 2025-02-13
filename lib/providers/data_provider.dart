import 'dart:convert';

import 'package:carousel_task/models/first_collection_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../constants/environment.dart';

class DataProvider extends ChangeNotifier {

  FirstCollection? _colection;

  FirstCollection? get collection {
    return _colection;
  }

  Future<http.Response> loadFirstApi() async {
    String url = Environment.FIRST_CAROUSEL_ENDPOINT;

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=utf-8',
    };

    final uri = Uri.parse(url);

    http.Response response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {

      _colection = FirstCollection.fromJson(jsonDecode(response.body));
      print(_colection);
      notifyListeners();
    } else {
      throw Exception('Chyba při načítání dat');
    }
    return response;
  }
}