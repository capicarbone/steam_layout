import 'package:flutter/material.dart';
import 'package:steam_flutter_layout/lateral_menu.dart';
import 'package:steam_flutter_layout/section_title.dart';
import 'package:steam_flutter_layout/steam_pager.dart';
import 'package:steam_flutter_layout/store_navbar.dart';
import 'package:steam_flutter_layout/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class SectionContainer extends StatelessWidget {
  final Widget child;
  final double? height;
  final Color? color;
  final Widget? leftChild;
  final bool showBorders;
  const SectionContainer(
      {Key? key,
      required this.child,
      this.color = Colors.black,
      this.leftChild = null,
      this.showBorders = false, this.height = null})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      color: color,
      alignment: Alignment.topCenter,
      child: Stack(children: [
        Container(
          width: 1220,
          color:
              showBorders ? Colors.white.withOpacity(0.2) : Colors.transparent,
          alignment: Alignment.centerRight,
          child: Container(
            width: 1033,
            color: showBorders
                ? Colors.white.withOpacity(0.2)
                : Colors.transparent,
            child: child,
          ),
       ),
        if (leftChild != null) leftChild!,
      ]),
    );
  }
}

class HeaderItem extends StatelessWidget {
  final String text;
  const HeaderItem({Key? key, required this.text}) : super(key: key);

  TextStyle _itemStyle() {
    return TextStyle(
        color: Color(0xffc5c3c0),
        decoration: TextDecoration.none,
        fontSize: 14);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text.toUpperCase(),
        style: _itemStyle(),
      ),
      padding: EdgeInsets.only(right: 14),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 44),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            children: [
              HeaderItem(text: "Steam"), // TODO to logo
              HeaderItem(text: "Store"),
              HeaderItem(text: "Community"),
              HeaderItem(text: "About"),
              HeaderItem(text: "Support")
            ],
          ),
          Positioned(
              top: 0,
              right: 0,
              child: Container(
                height: 23,
                width: 234,
                color: Colors.green,
              ))
        ],
      ),
    );
  }
}

class _BluePanel extends StatelessWidget {
  final String text;
  const _BluePanel({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      color: Colors.blue,
      child: Center(
          child: Text(
        text.toUpperCase(),
        style: TextStyle(color: Color(0xffffffff), fontSize: 16),
      )),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SectionContainer(
            child: Header(),
            height: 104,
            color: Color(0xff171a21),
          ),
          SectionContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 31,
                ),
                StoreNavbar(),
                SizedBox(
                  height: 42,
                ),
                ContentPadding(
                    child: SectionTitle(text: "Featured & Recommended")),
                SteamPager(),
                SizedBox(
                  height: 46,
                ),
                ContentPadding(
                    child: SectionTitle(
                  text: "Special Offers",
                  links: ['Browse More'],
                )),
                SteamPager(),
                SizedBox(
                  height: 46,
                ),
                ContentPadding(
                    child: SectionTitle(
                  text: "The Community Recommends",
                  links: ['Customize, Explore By tag, & more'],
                )),
                SteamPager(),
                SizedBox(
                  height: 76,
                ),
                ContentPadding(child: SectionTitle(text: "Browser Steam")),
                ContentPadding(
                    child: Row(
                  children: [
                    Expanded(child: _BluePanel(text: "New Releases")),
                    SizedBox(width: 8,),
                    Expanded(child: _BluePanel(text: "Specials")),
                    SizedBox(width: 8,),
                    Expanded(child: _BluePanel(text: "Free Games")),
                    SizedBox(width: 8,),
                    Expanded(child: _BluePanel(text: "By user Tags"))
                  ],
                )),
                SizedBox(
                  height: 38,
                ),
                ContentPadding(
                    child: SectionTitle(
                      text: "Popular VR Games",
                      links: ['Browse All'],
                    )),
                SteamPager(contentHeight: 134,),
                SizedBox(
                  height: 51,
                ),
              ],
            ),
            //height: 1921,
            color: Color(0xff1b2838),
            leftChild: LateralMenu(),
          ),
          SectionContainer(
            showBorders: true,
            child: Text("Tredings | Streaming | Updates"),
            height: 2143,
            color: Color(0xff1b2838),
          ),
          SectionContainer(
            showBorders: true,
            child: Text("Looking for recommendations"),
            height: 214,
          ),
          SectionContainer(
            showBorders: true,
            child: Text("Footer"),
            height: 156,
            color: Color(0xff171a21),
          ),
        ],
      ),
    );
  }
}
