import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:steam_flutter_layout/app_colors.dart';
import 'package:steam_flutter_layout/featured_game.dart';
import 'package:steam_flutter_layout/games_sample.dart';
import 'package:steam_flutter_layout/lateral_menu.dart';
import 'package:steam_flutter_layout/section_title.dart';
import 'package:steam_flutter_layout/steam_pager.dart';
import 'package:steam_flutter_layout/store_navbar.dart';
import 'package:steam_flutter_layout/streams_grid.dart';
import 'package:steam_flutter_layout/updates_and_offers.dart';
import 'package:steam_flutter_layout/utils.dart';

import 'header.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Steam',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
              // Not used yet
            titleLarge: GoogleFonts.nunito(
              fontSize: 24,
              fontWeight: FontWeight.w300,
              decoration: TextDecoration.none,
              color: Colors.white
            ),
              titleSmall: GoogleFonts.nunito(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.none,
                  color: Colors.white),
              titleMedium: GoogleFonts.nunito(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
              headlineSmall: TextStyle(
                  color: AppColors.darkText,
                  decoration: TextDecoration.none,
                  fontSize: 14),
              displayMedium:
                  GoogleFonts.nunito(decoration: TextDecoration.none),
              bodySmall: GoogleFonts.nunito(
                  color: AppColors.darkText,
                  decoration: TextDecoration.none,
                  fontSize: 11),
              bodyMedium: TextStyle(color: Color(0xffffffff)))),
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
      this.color = const Color(0x00),
      this.leftChild = null,
      this.showBorders = false,
      this.height = null})
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

class _SectionTab extends StatelessWidget {
  final String text;
  final bool selected;
  const _SectionTab({Key? key, required this.text, required this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      color: selected ? Color(0xff2a475e) : Color(0x00),
      height: 29,
      child: Text(
        text,
        style: TextStyle(
            color: Color(0xffffffff),
            fontSize: 14,
            decoration: TextDecoration.none),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Color(0xff1b2838),
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
                  SteamPager(
                    pages: [
                      FeaturedGame()
                    ],
                  ),
                  SizedBox(
                    height: 46,
                  ),
                  ContentPadding(
                      child: SectionTitle(
                    text: "Special Offers",
                    links: ['Browse More'],
                  )),
                  SteamPager(
                    pages: [
                      Container(
                        color: Colors.black.withOpacity(0.5),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 46,
                  ),
                  ContentPadding(
                      child: SectionTitle(
                    text: "The Community Recommends",
                    links: ['Customize, Explore By tag, & more'],
                  )),
                  SteamPager(
                    pages: [
                      Container(
                        color: Colors.black.withOpacity(0.5),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 76,
                  ),
                  ContentPadding(child: SectionTitle(text: "Browser Steam")),
                  ContentPadding(
                      child: Row(
                    children: [
                      Expanded(child: _BluePanel(text: "New Releases")),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(child: _BluePanel(text: "Specials")),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(child: _BluePanel(text: "Free Games")),
                      SizedBox(
                        width: 8,
                      ),
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
                  SteamPager(
                    pages: [
                      Container(
                        color: Colors.black.withOpacity(0.5),
                      )
                    ],
                    contentHeight: 134,
                  ),
                  SizedBox(
                    height: 51,
                  ),
                ],
              ),
              leftChild: LateralMenu(),
            ),
            SectionContainer(
                color: Color(0xff1b2838),
                child: Row(
                  children: [
                    _SectionTab(text: "New & Trading", selected: true),
                    _SectionTab(text: "Top Sellers", selected: false),
                    _SectionTab(text: "Popular Upcoming", selected: false),
                    _SectionTab(text: "Specials", selected: false),
                  ],
                )),
            SectionContainer(
              child: GamesSample(),
            ),
            SizedBox(
              height: 62,
            ),
            SectionContainer(
              child: Column(
                children: [
                  SectionTitle(
                    text: "Games Streaming Now",
                    links: ["View All"],
                  ),
                  StreamsGrid()
                ],
              ),
            ),
            SizedBox(
              height: 64,
            ),
            SectionContainer(
                child: Column(
              children: [
                SectionTitle(text: "Under \$10 USD"),
                SteamPager(
                  pages: [
                    Container(
                      color: Colors.black.withOpacity(0.5),
                    )
                  ],
                  contentHeight: 134,
                )
              ],
            )),
            SizedBox(
              height: 78,
            ),
            SectionContainer(
                child: Column(
              children: [
                SectionTitle(text: "Updates and Offers"),
                UpdatesAndOffers(),
              ],
            )),
            SizedBox(
              height: 50,
            ),
            SectionContainer(
                color: Color(0xff000000),
                height: 213,
                child: Column(
                  children: [
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      "Looking for recommendations?",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    Text(
                      "Sign in to view personalized recommendations",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    Text(
                      "Sign In",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    SizedBox(
                      height: 26,
                    ),
                    Text(
                      "Or sign up and join Steam for free",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                )),
            SectionContainer(
              child: Container(),
              height: 156,
              color: Color(0xff171a21),
            ),
          ],
        ),
      ),
    );
  }
}
