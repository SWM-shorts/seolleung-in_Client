import 'package:flutter/material.dart';
import 'package:seolleungin/constants/size_helper.dart';
import 'package:seolleungin/pages/app.dart';
import 'package:seolleungin/pages/search.dart';
import 'package:seolleungin/pages/splash.dart';
import 'package:seolleungin/widgets/item.dart';

import '../repositories/random_repository.dart';
import '../styles/color_style.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _filter(String text, navigation) {
    return Expanded(
      child: GestureDetector(
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: ColorStyle.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12.0),
            child: Center(
                child: Text(
              text,
              style: const TextStyle(
                  fontFamily: "NanumSquare",
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                  height: 1.3 // 줄간격
                  ),
            )),
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => navigation),
          );
        },
      ),
    );
  }

  _typeFilter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _filter("한식", App(initialIndex: 2, searchData: koreanFood)),
        const SizedBox(
          width: 15,
        ),
        _filter("중식", App(initialIndex: 2, searchData: chineseFood)),
        const SizedBox(
          width: 15,
        ),
        _filter("일식", App(initialIndex: 2, searchData: japaneseFood)),
        const SizedBox(
          width: 15,
        ),
        _filter("양식", App(initialIndex: 2, searchData: westernFood))
      ],
    );
  }

  _priceFilter() {
    return Expanded(
      child: Row(
        children: [
          _filter(
              "기술 소모임 \n멘토링\n회식", App(initialIndex: 2, searchData: mentorFood)),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              children: [
                _filter("1만원 미만", App(initialIndex: 2, searchData: lessFood)),
                const SizedBox(
                  height: 15,
                ),
                _filter("1만원 대", App(initialIndex: 2, searchData: moreFood))
              ],
            ),
          )
        ],
      ),
    );
  }

  _bodyWidget() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/logos/logo_full.png",
              width: 200,
              height: 100,
              fit: BoxFit.contain,
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Text(
                "랜덤 추천",
                style: TextStyle(
                    fontFamily: "NanumMyeongjo",
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Item(data: randomData),
            const SizedBox(
              height: 15,
            ),
            _typeFilter(),
            const SizedBox(
              height: 15,
            ),
            _priceFilter()
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(),
    );
  }
}
