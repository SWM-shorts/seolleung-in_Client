import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../styles/color_style.dart';

class Item extends StatefulWidget {
  Map data;
  Item({Key? key, required this.data}) : super(key: key);

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  String timeStatus = "영업중";

  _firstRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.data["name"].toString(),
          style: const TextStyle(
              fontFamily: "NanumSquare",
              fontWeight: FontWeight.w700,
              fontSize: 18),
        ),
        IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          icon: const Icon(
            FontAwesomeIcons.angleRight,
            size: 18,
          ),
          onPressed: () async {
            // 해당 네이버 링크로 이동한다.
            final Uri url = Uri.parse(widget.data["mapLink"]);
            if (await canLaunchUrl(url)) {
              await launchUrl(url, mode: LaunchMode.externalApplication);
            } else {
              // 유효하지 않은 url일 경우, url을 눌러도 반응하지 않는다.
              return null;
            }
          },
        ),
      ],
    );
  }

  _secondRow() {
    return Row(
      children: [
        const Icon(
          FontAwesomeIcons.thumbsUp,
          size: 18,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          widget.data["signatureMenu"].toString(),
          style: const TextStyle(fontFamily: "NanumSquare", fontSize: 15),
        )
      ],
    );
  }

  _thirdRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          FontAwesomeIcons.fileLines,
          size: 18,
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          children: [
            const SizedBox(
              height: 2,
            ),
            GestureDetector(
              child: const Text(
                "메뉴 더보기",
                style: TextStyle(
                    shadows: [
                      Shadow(offset: Offset(0, -2), color: ColorStyle.link)
                    ],
                    fontFamily: "NanumSquare",
                    fontSize: 15,
                    color: Colors.transparent,
                    decoration: TextDecoration.underline,
                    decorationColor: ColorStyle.link),
              ),
              onTap: () async {
                // 해당 메뉴 이미지 링크로 이동한다.
                final Uri url = Uri.parse(widget.data["menuLink"]);
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                } else {
                  // 유효하지 않은 url일 경우, url을 눌러도 반응하지 않는다.
                  const snackBarNoMenu = SnackBar(
                    content: Text(
                      "메뉴를 확인할 수 없습니다.",
                      style: TextStyle(
                        color: ColorStyle.black,
                      ),
                    ),
                    duration: Duration(seconds: 2),
                    backgroundColor: ColorStyle.white,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBarNoMenu);
                  return null;
                }
              },
            ),
          ],
        )
      ],
    );
  }

  _fourthRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          FontAwesomeIcons.locationDot,
          size: 18,
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          // text overflow 처리를 위해 Expanded 로 감싸줌
          child: Row(
            children: [
              Expanded(
                // text overflow 처리를 위해 Expanded 로 감싸줌
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      child: Text(
                        widget.data["address"].toString(),
                        style: const TextStyle(
                            shadows: [
                              Shadow(
                                  offset: Offset(0, -2), color: ColorStyle.link)
                            ],
                            fontFamily: "NanumSquare",
                            fontSize: 15,
                            color: Colors.transparent,
                            decoration: TextDecoration.underline,
                            decorationColor: ColorStyle.link),
                        overflow: TextOverflow.ellipsis,
                      ),
                      onTap: () async {
                        // 해당 메뉴 이미지 링크로 이동한다.
                        final Uri url = Uri.parse(widget.data["mapLink"]);
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url,
                              mode: LaunchMode.externalApplication);
                        } else {
                          // 유효하지 않은 url일 경우, url을 눌러도 반응하지 않는다.
                          const snackBarNoMenu = SnackBar(
                            content: Text(
                              "위치를 확인할 수 없습니다.",
                              style: TextStyle(
                                color: ColorStyle.black,
                              ),
                            ),
                            duration: Duration(seconds: 2),
                            backgroundColor: ColorStyle.white,
                          );
                          ScaffoldMessenger.of(context)
                              .showSnackBar(snackBarNoMenu);
                          return null;
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  _fifthRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          FontAwesomeIcons.clock,
          size: 18,
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: GestureDetector(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.data["businessHour"].toString(),
                    style: const TextStyle(
                      fontFamily: "NanumSquare",
                      fontSize: 15,
                    ),
                    // overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  _sixthRow() {
    return Container(
      height: 50,
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          Chip(
            label: Text(
              widget.data["resclass"].toString(),
              style: const TextStyle(
                  fontFamily: "NanumSquare",
                  fontSize: 15,
                  color: ColorStyle.typeTextColor),
            ),
            backgroundColor: ColorStyle.typeBackgroundColor,
          ),
          const SizedBox(
            width: 5,
          ),
          Chip(
            label: Text(
              widget.data["signatureMenu"].toString(),
              style: const TextStyle(
                  fontFamily: "NanumSquare",
                  fontSize: 15,
                  color: ColorStyle.mainMenuTextColor),
            ),
            backgroundColor: ColorStyle.mainMenuBackgroundColor,
          ),
          const SizedBox(
            width: 5,
          ),
          // Chip(
          //   label: Text(
          //     timeStatus,
          //     style: const TextStyle(
          //         fontFamily: "NanumSquare",
          //         fontSize: 15,
          //         color: ColorStyle.timeStatusTextColor),
          //   ),
          //   backgroundColor: ColorStyle.timeStatusBackgroundColor,
          // ),
          // const SizedBox(
          //   width: 5,
          // ),
          Chip(
            label: Text(
              widget.data["price"].toString(),
              style: const TextStyle(
                  fontFamily: "NanumSquare",
                  fontSize: 15,
                  color: ColorStyle.priceTextColor),
            ),
            backgroundColor: ColorStyle.priceBackgroundColor,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: ColorStyle.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _firstRow(),
            const SizedBox(
              height: 15,
            ),
            _secondRow(),
            const SizedBox(
              height: 15,
            ),
            _thirdRow(),
            const SizedBox(
              height: 15,
            ),
            _fourthRow(),
            const SizedBox(
              height: 15,
            ),
            _fifthRow(),
            const SizedBox(
              height: 15,
            ),
            _sixthRow(),
          ],
        ),
      ),
    );
  }
}
