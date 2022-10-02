import 'package:http/http.dart' as http;
import 'dart:convert';

import '../pages/splash.dart';

getRandomRestaurant() async {
  var url = Uri.parse('http://13.125.79.231:8080/restaurant/random');
  var response = await http.get(url);
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String responseBody =
      utf8.decode(response.bodyBytes); // 한글이 포함된 경우 깨지기 때문에 decode해준다.

  print("statusCode: ${statusCode}");
  print("responseHeaders: ${responseHeaders}");
  print("responseBody: ${responseBody}");
  Map<String, dynamic> randomData = jsonDecode(responseBody);
  // print("getRandomRestaurant() 함수에서 받아온 데이터를 넣어준 randomData : ");
  // print(randomData);
  return randomData;
}
