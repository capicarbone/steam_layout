import 'dart:html';

import 'package:flutter/material.dart';
import 'package:steam_flutter_layout/app_colors.dart';
import 'package:steam_flutter_layout/triangle.dart';
import 'data/game.dart';
import 'game_commons.dart';

class _Screenshot extends StatelessWidget {
  final String asset;
  final bool selected;
  const _Screenshot({Key? key, required this.asset, this.selected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Image.asset(
            colorBlendMode: BlendMode.dstATop,
            color: Colors.black.withOpacity(selected ? 1.0 : 0.6),
            asset,
            height: 69,
            width: 162,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

class _GameDetails extends StatelessWidget {
  final Game game;
  final selectedIndex;
  final Function onMouseEnter;
  final Function onMouseExit;
  const _GameDetails(
      {Key? key,
      required this.game,
      required this.onMouseEnter,
      required this.onMouseExit,
      required this.selectedIndex})
      : super(key: key);

  Widget _screenshotWrapper(int position) {
    return MouseRegion(
      onExit: (_) => onMouseExit(position),
      onEnter: (_) => onMouseEnter(position),
      child: _Screenshot(
        asset: game.screenshots[position],
        selected: selectedIndex == position,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fitHeight,
              alignment: Alignment.centerRight,
              image: AssetImage('images/background_maincap_2.jpg'))),
      width: 323,
      child: Padding(
        padding: const EdgeInsets.only(top: 12, right: 9, bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                alignment: Alignment.centerLeft,
                height: 63,
                padding: EdgeInsets.only(left: 18),
                child: Text(
                  game.name,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(height: 1),
                )),
            Padding(
              padding: const EdgeInsets.only(bottom: 13),
              child: Row(
                children: [
                  Expanded(
                    child: _screenshotWrapper(0),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  _screenshotWrapper(1),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: _screenshotWrapper(2),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  _screenshotWrapper(3),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Available now",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 21),
                    ),
                    Row(
                      children: [
                        ...game.tags.map((e) => GameTag(tag: e)).toList()
                      ],
                    ),
                    Expanded(child: Container()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (game.price.hasDiscount)
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                color: AppColors.green,
                                height: 15,
                                child: Text(
                                  game.price.discountFormatted,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          fontSize: 12,
                                          color: AppColors.greenLight),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 1),
                                color: Colors.black,
                                child: Text(
                                  game.price.basePriceFormatted,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          color: Color(0xff7193a6),
                                          decoration:
                                              TextDecoration.lineThrough),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 1),
                                color: Colors.black,
                                child: Text(
                                  game.price.currentPriceFormatted,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          color: AppColors.highlightedText),
                                ),
                              ),
                            ],
                          ),
                        if (!game.price.hasDiscount)
                          Text(
                            game.price.currentPriceFormatted,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: AppColors.highlightedText),
                          ),
                        Row(
                          children: [
                            ...[Icons.window, Icons.apple]
                                .where((icon) =>
                                    (icon == Icons.window && game.forWindows) ||
                                    (icon == Icons.apple && game.forMac))
                                .map((e) => Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: Icon(
                                        e,
                                        color: AppColors.darkText,
                                        size: 17,
                                      ),
                                    ))
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _GamePreview extends StatelessWidget {
  final Game game;
  const _GamePreview({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 306 + 7,
      height: 312,
      child: Stack(
        children: [
          Positioned(
            left: 6,
            width: 306,
            height: 312,
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.blue,
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        const Color.fromRGBO(199, 213, 224, 1),
                        const Color.fromRGBO(227, 234, 239, 1),
                      ]),
                  boxShadow: [BoxShadow(color: Colors.black, blurRadius: 12)]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 4),
                    child: Text(
                      game.name,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(
                              fontSize: 15,
                              color: Color.fromRGBO(38, 54, 59, 1)),
                    ),
                  ),
                  Text("Released: May 13, 2020",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 10, color: Color(0xff30455a))),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Image.asset(game.screenshots[0],
                        height: 153,
                        width: double.infinity,
                        fit: BoxFit.fitWidth),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Container(
                      height: 36,
                      padding: EdgeInsets.all(4),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Color(0xff516b7d),
                          borderRadius: BorderRadius.circular(2)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Overall user reviews:",
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                    color: AppColors.darkText,
                                    fontSize: 12,
                                    height: 1),
                          ),
                          Text("Very Positive",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                      color: AppColors.highlightedText,
                                      fontSize: 12))
                        ],
                      ),
                    ),
                  ),
                  Text(
                    "User tags:",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 12, color: Color.fromRGBO(48, 60, 90, 1)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Row(
                      children: game.tags
                          .sublist(0, 3)
                          .map((e) => GameTag(
                                tag: e,
                                backgroundColor:
                                    Color.fromRGBO(150, 163, 174, 1),
                              ))
                          .toList(),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 35,
            left: 0,
            child: Container(
              height: 15,
              width: 7,
              child: RotatedBox(
                  quarterTurns: -1,
                  child: CustomPaint(
                    painter: TrianglePainter(const Color.fromRGBO(227, 234, 239, 1)),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

class FeaturedGame extends StatefulWidget {
  final Game game;
  const FeaturedGame({Key? key, required this.game}) : super(key: key);

  @override
  State<FeaturedGame> createState() => _FeaturedGameState();
}

class _FeaturedGameState extends State<FeaturedGame> {
  int _selectedIndex = -1;
  bool _hovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _hovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _hovered = false;
        });
      },
      child: OverflowBox(
        alignment: Alignment.centerLeft,
        maxWidth: 940 + 353 - 3,
        child: Container(
          width: 940 + 353 - 3,
          child: Stack(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 353,
                width: 940,
                decoration: BoxDecoration(
                    // border: Border.all(color: Color(0xff1c262f)),
                    color: Color(0xff0b151e),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.black,
                          offset: Offset(0, 0),
                          blurRadius: 7)
                    ]),
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        _GameDetails(
                          game: widget.game,
                          onMouseEnter: (i) => setState(() => _selectedIndex = i),
                          onMouseExit: (i) => setState(() => _selectedIndex = -1),
                          selectedIndex: _selectedIndex,
                        )
                      ],
                    ),
                    ClipRect(
                      child: Container(
                        width: 700,
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: 616,
                          decoration: BoxDecoration(boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.black,
                                offset: Offset(0, 0),
                                blurRadius: 10,
                                spreadRadius: 5)
                          ]),
                          child: Image.asset(
                            _selectedIndex == -1
                                ? widget.game.horizontalCapsuleAsset
                                : widget.game.screenshots[_selectedIndex],
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (_hovered) Positioned( left: 940 - 3, child: _GamePreview(game: widget.game))
            ],
          ),
        ),
      ),
    );
  }
}
