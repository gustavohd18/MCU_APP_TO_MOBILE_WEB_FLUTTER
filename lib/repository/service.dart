import 'dart:convert';

import 'package:mcu_app/model/news.dart';
import 'package:http/http.dart' as http;

class Service {
  var https = http.Client();

  Future<List<NewsMarvel>> getNews() async {
    var url = Uri.https(
        'mcu-movies-api.herokuapp.com', '/api/v1/news', {'q': '{http}'});

    final response = await https.get(url);

    Map data = jsonDecode(response.body);

    final list = (data['news']['data'] as List)
        .map((listNews) => NewsMarvel.fromJSON(listNews))
        .toList();

    return list;
  }
}
