import 'dart:async';

import 'package:flutter/material.dart';
import 'package:seolleungin/styles/color_style.dart';

import '../repositories/random_repository.dart';
import '../repositories/all_repository.dart';
import 'app.dart';

Map randomData = {}; // 오늘의 추천 식당 데이터가 들어오는 부분
List allData = []; // 전체 추천 식당 데이터가 들어오는 부분
List koreanFood = []; // 한식 식당 데이터가 들어오는 부분
List chineseFood = []; // 중식 식당 데이터가 들어오는 부분
List japaneseFood = []; // 일식 식당 데이터가 들어오는 부분
List westernFood = []; // 양식 식당 데이터가 들어오는 부분
List mentorFood = []; // 기술 소모임, 멘토링, 회식에 적합한 식당 데이터가 들어오는 부분
List lessFood = []; // 1만원 미만 식당 데이터가 들어오는 부분
List moreFood = []; // 1만원 대 식당 데이터가 들어오는 부분

class Splash extends StatefulWidget {
  Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void moveScreen() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => App(
                  initialIndex: 1, searchData: allData,
                )),
        (route) => false);
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () async {
      // await loadContents(); // 서버에서 데이터를 모두 가져올 때까지 화면을 이동하지 않는다.
      randomData = await getRandomRestaurant();
      allData = await getAllRestaurants();
      koreanFood =
          allData.where(((element) => element['resclass'] == "한식")).toList();
      chineseFood =
          allData.where(((element) => element['resclass'] == "중식")).toList();
      japaneseFood =
          allData.where(((element) => element['resclass'] == "일식")).toList();
      westernFood =
          allData.where(((element) => element['resclass'] == "양식")).toList();
      mentorFood =
          allData.where(((element) => element['mentorClass'] == 1)).toList();
      lessFood =
          allData.where(((element) => element['price'] == "1만원 미만")).toList();
      moreFood =
          allData.where(((element) => element['price'] == "1만원대")).toList();
      moveScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorStyle.backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/logos/logo.png",
            width: 200,
            height: 200,
            fit: BoxFit.contain,
          )
        ],
      ),
    );
  }
}