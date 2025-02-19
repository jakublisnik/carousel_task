import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants/environment.dart';
import '../models/first_collection_model.dart';
import '../models/second_collection_model.dart';

class DataServices {
  Future<FirstCollection> loadFirstApi(context) async {
    String url = Environment.FIRST_CAROUSEL_ENDPOINT;
    late FirstCollection data;
    final uri = Uri.parse(url);

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=utf-8',
    };


    try {
      http.Response response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        final item = jsonDecode(response.body);
        data = FirstCollection.fromJson(item);
      } else {
        throw Exception('Chyba při načítání dat');
      }
    } catch (e) {
      print('Error Occurred' + e.toString());
    }
    return data;
  }

  Future<SecondCollection> loadSecondApi(context) async {
    String url = Environment.SECOND_CAROUSEL_ENDPOINT;
    late SecondCollection data;
    final uri = Uri.parse(url);

    Map<String, String> headers = {
      'Accept': 'application/json',
    };

    try{
    http.Response response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      final item = jsonDecode(response.body);
      data = SecondCollection.fromJson(item);
    } else {
      throw Exception('Chyba při načítání dat');
    }
    } catch (e) {
      print('Error Occurred' + e.toString());
    }
    return data;
  }
}
