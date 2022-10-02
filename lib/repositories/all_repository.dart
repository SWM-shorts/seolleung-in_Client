import 'dart:convert';

import 'package:http/http.dart' as http;

getAllRestaurants() async {
  var url = Uri.parse("http://13.125.79.231:8080/restaurant");
  var response = await http.get(url);
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String responseBody = utf8.decode(response.bodyBytes);
  print("statusCode: ${statusCode}");
  print("responseHeaders: ${responseHeaders}");
  print("responseBody: ${responseBody}");
  List<dynamic> allData = jsonDecode(responseBody);
  return allData;
}

// 궁금한 점, 고민해야 할 점
// 1. 1만원 대 미만과 1만원 대 초과가 동시에 있을 수 있는가
// 2. 영업중에 대한 처리를 어떻게 할 것인가