import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../styles/color_style.dart';

class CustomerService extends StatefulWidget {
  CustomerService({Key? key}) : super(key: key);

  @override
  State<CustomerService> createState() => _CustomerServiceState();
}

class _CustomerServiceState extends State<CustomerService> {
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "선릉-in 소개",
                      style: TextStyle(
                          fontFamily: "NanumMyeongjo",
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "개발자들의 개인 취향을 바탕으로 만들어진 선릉 맛집 리스트입니다. 저희가 직접 가서 먹어본 곳만을 대상으로 하고 있습니다.",
                      style: TextStyle(
                          fontFamily: "NanumSquare", fontSize: 15, height: 1.5),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "이 앱은 과학기술정보통신부에서 주관하는 소프트웨어마에스트로 연수생, 멘토님, 연구원님의 밥 선택을 돕고자 만들어졌습니다.",
                      style: TextStyle(
                          fontFamily: "NanumSquare", fontSize: 15, height: 1.5),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "선릉 근처 거주하시는 분들과 선릉 근처 직장인 분들도 환영합니다!",
                      style: TextStyle(
                          fontFamily: "NanumSquare", fontSize: 15, height: 1.5),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "앱에 대한 의견이 있거나 맛집 추천을 하고 싶으신 분들은 아래 버튼을 눌러 문의해주세요!",
                      style: TextStyle(
                          fontFamily: "NanumSquare",
                          fontSize: 15,
                          height: 1.5,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),
            OutlinedButton(
              onPressed: () async {
                if (await canLaunchUrl(
                    Uri.parse("https://open.kakao.com/o/sIjhg5Ae"))) {
                  await launchUrl(
                      Uri.parse("https://open.kakao.com/o/sIjhg5Ae"),
                      mode: LaunchMode.externalApplication);
                } else {
                  throw 'Could not launch Kakao Openchatting';
                }
              },
              style: OutlinedButton.styleFrom(
                  backgroundColor: ColorStyle.white,
                  foregroundColor: ColorStyle.black,
                  side: BorderSide.none,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      "문의하기",
                      style: TextStyle(
                          fontFamily: "NanumSquare",
                          fontSize: 18,
                          height: 1.5,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ],
              ),
            )
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
