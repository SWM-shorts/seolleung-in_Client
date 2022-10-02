import 'package:flutter/material.dart';
import 'package:seolleungin/pages/splash.dart';
import 'package:seolleungin/widgets/item.dart';

import '../widgets/bottom_navigation_bar.dart';

class Search extends StatefulWidget {
  List data;
  Search({Key? key, required this.data}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  _makeDataList() {
    // 아마 Expanded 위젯으로 감싸주어야 할 것 같다.
    return Expanded(
      // Column 안에 Listview를 넣으면 발생하는 에러 해결 위해 Expanded로 감싸주었다.
      child: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: widget.data.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Item(data: widget.data[index]),
                ],
              );
              // return "";
            }),
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
            _makeDataList(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(),
      // bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
