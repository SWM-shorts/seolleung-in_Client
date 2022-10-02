import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:seolleungin/pages/splash.dart';

import '../pages/customer_service.dart';
import '../pages/home.dart';
import '../pages/search.dart';
import '../styles/color_style.dart';

class MyBottomNavigationBar extends StatefulWidget {
  MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  late int _currentPageIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentPageIndex = 1;
  }

  Widget _bodyWidget() {
    switch (_currentPageIndex) {
      case 0:
        return CustomerService();
      case 1:
        return Home();
      case 2:
        return Search(
          data: allData,
        );
    }
    return Container();
  }

  Widget _bottomNavigationBarWidget() {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.solidMessage,
              color: ColorStyle.grey,
              size: 20,
            ),
            activeIcon: Icon(
              FontAwesomeIcons.solidMessage,
              color: ColorStyle.black,
              size: 20,
            ),
            label: "고객센터"),
        BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.house,
              color: ColorStyle.grey,
              size: 20,
            ),
            activeIcon: Icon(
              FontAwesomeIcons.house,
              color: ColorStyle.black,
              size: 20,
            ),
            label: "홈"),
        BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.magnifyingGlass,
              color: ColorStyle.grey,
              size: 20,
            ),
            activeIcon: Icon(
              FontAwesomeIcons.magnifyingGlass,
              color: ColorStyle.black,
              size: 20,
            ),
            label: "탐색"),
      ],
      onTap: (int index) {
        setState(() {
          _currentPageIndex = index;
        });
      },
      elevation: 0,
      currentIndex: _currentPageIndex,
      selectedItemColor: ColorStyle.black,
    );
  }

  DateTime preBackpress = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: _bodyWidget(),
          bottomNavigationBar: _bottomNavigationBarWidget(),
        ),
        onWillPop: () async {
          final timegap = DateTime.now().difference(preBackpress);
          final cantExit =
              timegap >= const Duration(seconds: 2); // 2초 이상 차이 나면 나갈 수 없다.
          preBackpress = DateTime.now();
          if (cantExit) {
            print("앱을 종료할 수 없습니다.");
            return false;
          } else {
            const snackBarToExitApp = SnackBar(
              content: Text(
                "앱을 종료합니다.",
                style: TextStyle(color: ColorStyle.black),
              ),
              duration: Duration(seconds: 2),
              backgroundColor: ColorStyle.white,
              behavior: SnackBarBehavior.floating,
              elevation: 10,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBarToExitApp);
            return true;
          }
        });
  }
}
