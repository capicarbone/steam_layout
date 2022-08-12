import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:steam_flutter_layout/app_colors.dart';
import 'package:steam_flutter_layout/data/games_provider.dart';
import 'package:steam_flutter_layout/featured_game.dart';
import 'package:steam_flutter_layout/games_sample.dart';
import 'package:steam_flutter_layout/lateral_menu.dart';
import 'package:steam_flutter_layout/limited_promo_banner.dart';
import 'package:steam_flutter_layout/offers_banner.dart';
import 'package:steam_flutter_layout/section_title.dart';
import 'package:steam_flutter_layout/simple_game_card.dart';
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
                  color: Colors.white),
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
              displayMedium: GoogleFonts.nunito(
                  decoration: TextDecoration.none, fontSize: 13),
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
  final Gradient? gradient;
  final Widget? leftChild;
  final bool showBorders;
  const SectionContainer(
      {Key? key,
      required this.child,
      this.gradient,
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
      decoration: gradient != null
          ? BoxDecoration(gradient: gradient)
          : BoxDecoration(color: color),
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
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(3),
          boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.black, offset: Offset(0, 0), blurRadius: 4)
          ]),
      child: Center(
          child: Text(
        text.toUpperCase(),
        style: Theme.of(context).textTheme.displayMedium!.copyWith(
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
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
      decoration: BoxDecoration(
          color: selected ? Color(0xff2a475e) : Color(0x00),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(3), topRight: Radius.circular(3))),
      height: 29,
      child: Center(
        child: Text(
          text,
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
              color: selected ? Color(0xffffffff) : Color(0xff2f89bc),
              fontSize: 14,
              decoration: TextDecoration.none),
        ),
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
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  color: Color(0xff384582),
                  child: Center(
                    child: Container(
                      height: 450,

                      child: LimitedPromoBanner(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 31),
                  child: SectionContainer(child: StoreNavbar()),
                ),
              ],
            ),
            SectionContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 42,
                  ),
                  ContentPadding(
                      child: SectionTitle(title: "Featured & Recommended")),
                  SteamPager(
                    pages: GamesProvider.getMany(1)
                        .map((e) => FeaturedGame(game: e))
                        .toList(),
                  ),
                  SizedBox(
                    height: 46,
                  ),
                  ContentPadding(
                      child: SectionTitle(
                    title: "Special Offers",
                    links: ['Browse More'],
                  )),
                  SteamPager(
                    contentHeight: 390,
                    pages: [OffersBanner(games: GamesProvider.getMany(4),)],
                  ),
                  SizedBox(
                    height: 46,
                  ),
                  ContentPadding(
                      child: SectionTitle(
                    title: "The Community Recommends",
                    subtitle: "These games today",
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
                  ContentPadding(child: SectionTitle(title: "Browser Steam")),
                  ContentPadding(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...[
                        "New Releases",
                        "Specials",
                        "Free Games",
                        "By user Tags"
                      ]
                          .map((e) => Container(
                                width: 228,
                                child: _BluePanel(
                                  text: e,
                                ),
                              ))
                          .toList()
                    ],
                  )),
                  SizedBox(
                    height: 38,
                  ),
                  ContentPadding(
                      child: SectionTitle(
                    title: "Popular VR Games",
                    links: ['Browse All'],
                  )),
                  SteamPager(
                    pages: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: GamesProvider.getMany(4).map((e) => Container(
                              width: 229,
                              height: 134,
                              child: SimpleGameCard(game: e,)),).toList()
                        ),
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
                child: ContentPadding(
                  child: Row(
                    children: [
                      _SectionTab(text: "New & Trading", selected: true),
                      _SectionTab(text: "Top Sellers", selected: false),
                      _SectionTab(text: "Popular Upcoming", selected: false),
                      _SectionTab(text: "Specials", selected: false),
                    ],
                  ),
                )),
            SectionContainer(
              gradient: LinearGradient(colors: [
                Color.fromRGBO(42, 71, 94, 1),
                Color.fromRGBO(42, 71, 94, 0)
              ], stops: [
                0.05,
                0.7
              ], begin: Alignment.topLeft, end: Alignment.bottomLeft),
              child: ContentPadding(child: GamesSample()),
            ),
            SizedBox(
              height: 62,
            ),
            SectionContainer(
              child: Column(
                children: [
                  ContentPadding(
                    child: SectionTitle(
                      title: "Games Streaming Now",
                      links: ["View All"],
                    ),
                  ),
                  ContentPadding(child: StreamsGrid())
                ],
              ),
            ),
            SizedBox(
              height: 64,
            ),
            SectionContainer(
                child: Column(
              children: [
                ContentPadding(child: SectionTitle(title: "Under \$10 USD")),
                SteamPager(
                  pages: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: GamesProvider.getMany(4).map((e) => Container(
                            width: 229,
                            height: 134,
                            child: SimpleGameCard(game: e,)),).toList()
                    ),
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
                ContentPadding(
                    child: SectionTitle(title: "Updates and Offers")),
                ContentPadding(child: UpdatesAndOffers(featuredGame: GamesProvider.getOne(), games: GamesProvider.getMany(2),)),
              ],
            )),
            SizedBox(
              height: 50,
            ),
            SectionContainer(
                color: Color(0xff000000),
                child: Column(
                  children: [
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      "Looking for recommendations?",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(color: Color(0xff67c1f5), fontSize: 24),
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    Text(
                      "Sign in to view personalized recommendations",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 15, color: Color(0xff8f98a0)),
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    Container(
                      padding: EdgeInsets.all(1),
                      // color: Colors.blue,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border:
                              Border.all(width: 2, color: Color(0xff172030)),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: <Color>[
                                Color(0xffa4d007),
                                Color(0xff536904),
                              ],
                              stops: <double>[
                                0.05,
                                0.95
                              ])),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 7, horizontal: 16),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                              Color(0xff799905),
                              Color(0xff536904),
                            ],
                                stops: [
                              0.05,
                              0.95
                            ])),
                        child: Text(
                          "Sign In",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Color(0xffD2E885)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 26,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 21),
                      child: RichText(
                        text: TextSpan(
                            text: "Or ",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    color: Color(0xff8f98a0), fontSize: 15),
                            children: const <TextSpan>[
                              TextSpan(
                                  text: 'sign up',
                                  style: TextStyle(color: Colors.white)),
                              TextSpan(text: " and join Steam for free")
                            ]),
                      ),
                    ),
                  ],
                )),
            SectionContainer(
              // height: 156,
              color: Color(0xff171a21),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Color(0xffc6d4df), width: 0.5))),
                    height: 32,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 15),
                    child: Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Image.asset(
                              "images/footerLogo_valve_new.png",
                              height: 25,
                              width: 88,
                            )),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "© 2022 Valve Corporation.  All rights reserved.  All trademarks are property of their respective owners in the US and other countries.",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: Color(0xff8F98A0), fontSize: 13),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "VAT included in all prices where applicable.",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: Color(0xff8F98A0),
                                          fontSize: 13),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Text(
                                        "Privacy Policy",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                                color: Color(0xFFC6D4DF),
                                                fontSize: 12),
                                      ),
                                    ),
                                    Container(
                                      height: 12,
                                      width: 1,
                                      color: Color(0xFF8F98A0),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Text(
                                        "Legal",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                                color: Color(0xFFC6D4DF),
                                                fontSize: 12),
                                      ),
                                    ),
                                    Container(
                                      height: 12,
                                      width: 1,
                                      color: Color(0xFF8F98A0),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Text(
                                        "Steam Subscriber Agreement",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                                color: Color(0xFFC6D4DF),
                                                fontSize: 12),
                                      ),
                                    ),
                                    Container(
                                      height: 12,
                                      width: 1,
                                      color: Color(0xFF8F98A0),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Text(
                                        "Refunds",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                                color: Color(0xFFC6D4DF),
                                                fontSize: 12),
                                      ),
                                    ),
                                    Container(
                                      height: 12,
                                      width: 1,
                                      color: Color(0xFF8F98A0),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Text(
                                        "Cookies",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                                color: Color(0xFFC6D4DF),
                                                fontSize: 12),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        )),
                        Image.asset("images/logo_steam_footer.png")
                      ],
                    ),
                  ),
                  Container(
                    height: 20,
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(
                                color: Color(0xffc6d4df), width: 0.5))),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "About Valve",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Color(0xFFC6D4DF), fontSize: 13),
                        ),
                      ),
                      Container(
                        height: 12,
                        width: 1,
                        color: Color(0xFF8F98A0),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Jobs",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Color(0xFFC6D4DF), fontSize: 13),
                        ),
                      ),
                      Container(
                        height: 12,
                        width: 1,
                        color: Color(0xFF8F98A0),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Steamworks",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Color(0xFFC6D4DF), fontSize: 13),
                        ),
                      ),
                      Container(
                        height: 12,
                        width: 1,
                        color: Color(0xFF8F98A0),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Steam Distribution",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Color(0xFFC6D4DF), fontSize: 13),
                        ),
                      ),
                      Container(
                        height: 12,
                        width: 1,
                        color: Color(0xFF8F98A0),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Support",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Color(0xFFC6D4DF), fontSize: 13),
                        ),
                      ),
                      Container(
                        height: 12,
                        width: 1,
                        color: Color(0xFF8F98A0),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Gift Cards",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Color(0xFFC6D4DF), fontSize: 13),
                        ),
                      ),
                      Container(
                        height: 12,
                        width: 1,
                        color: Color(0xFF8F98A0),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 14,
                              height: 14,
                              child: Image.asset("images/ico_facebook.gif"),
                              margin: EdgeInsets.only(right: 4),
                            ),
                            Text(
                              "@Steam",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: Color(0xFFC6D4DF), fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 12,
                        width: 1,
                        color: Color(0xFF8F98A0),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 14,
                              height: 14,
                              child: Image.asset("images/ico_twitter.gif"),
                              margin: EdgeInsets.only(right: 4),
                            ),
                            Text(
                              "@Steam",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: Color(0xFFC6D4DF), fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 32,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
