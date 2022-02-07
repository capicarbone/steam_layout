import 'package:flutter/material.dart';
import 'package:steam_flutter_layout/lateral_menu.dart';
import 'package:steam_flutter_layout/section_title.dart';
import 'package:steam_flutter_layout/steam_pager.dart';
import 'package:steam_flutter_layout/store_navbar.dart';

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
  final double height;
  final Color? color;
  final Widget? leftChild;
  final bool showBorders;
  const SectionContainer(
      {Key? key,
      required this.child,
      this.color = Colors.black,
      this.leftChild = null,
        this.showBorders = false,
      required this.height})
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
          height: double.infinity,
          color: showBorders ? Colors.white.withOpacity(0.2) : Colors.transparent,
          alignment: Alignment.centerRight,
          child: Container(
            width: 1033,
            height: double.infinity,
            color: showBorders ? Colors.white.withOpacity(0.2) : Colors.transparent,
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
    return TextStyle(color: Color(0xffc5c3c0), decoration: TextDecoration.none, fontSize: 14);
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Text(text.toUpperCase(), style: _itemStyle(),), padding: EdgeInsets.only(right: 14),);
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

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
                SizedBox(height: 31,),
                StoreNavbar(),
                SizedBox(height: 42,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 44),
                  child: SectionTitle(text: "Featured & Recommended"),
                ),
                SizedBox(height: 14,),
                SteamPager()
              ],
            ),
            height: 1921,
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
