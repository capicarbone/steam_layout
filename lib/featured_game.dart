import 'dart:async';
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

class _GamePreview extends StatefulWidget {
  final Game game;
  const _GamePreview({Key? key, required this.game}) : super(key: key);

  @override
  State<_GamePreview> createState() => _GamePreviewState();
}

class _GamePreviewState extends State<_GamePreview>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _inAnimation;
  Timer? countdownTimer;
  var currentScreenshotIndex = 0;
  var previousScreenshotIndex = 0;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _inAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    countdownTimer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      setState(() {
        previousScreenshotIndex = currentScreenshotIndex;
        currentScreenshotIndex =
            (currentScreenshotIndex + 1) % widget.game.screenshots.length;
        _controller.forward(from: 0);
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    countdownTimer!.cancel();
    super.dispose();
  }

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
                      widget.game.name,
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
                    child: Stack(
                      children: [
                        Image.asset(
                            widget.game.screenshots[previousScreenshotIndex],
                            height: 153,
                            width: double.infinity,
                            fit: BoxFit.fitWidth),
                        FadeTransition(
                          opacity: _inAnimation,
                          child: Image.asset(
                              widget.game.screenshots[currentScreenshotIndex],
                              height: 153,
                              width: double.infinity,
                              fit: BoxFit.fitWidth),
                        ),
                      ],
                    ),
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
                      children: widget.game.tags
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
                    painter:
                        TrianglePainter(const Color.fromRGBO(227, 234, 239, 1)),
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

class _FeaturedGameState extends State<FeaturedGame>
    with TickerProviderStateMixin {
  int _selectedIndex = -1;
  int _previousSelectedIndex = -1;
  // bool _hovered = false;
  late AnimationController _detailsAnimationController;
  late AnimationController _screenshotsAnimationController;
  late CurvedAnimation _detailsAnimation;
  late CurvedAnimation _screenshotsAnimation;

  @override
  void initState() {
    _detailsAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _detailsAnimation = CurvedAnimation(
        parent: _detailsAnimationController, curve: Curves.easeIn);

    _screenshotsAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _screenshotsAnimation = CurvedAnimation(
        parent: _screenshotsAnimationController, curve: Curves.easeIn);

    super.initState();
  }

  @override
  void dispose() {
    _detailsAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() {
          _detailsAnimationController.forward(from: 0);
          // _hovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          // _hovered = false;
          _detailsAnimationController.reverse(from: 100);
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
                          onMouseEnter: (i) {
                            setState(() {
                              _previousSelectedIndex = _selectedIndex;
                              _selectedIndex = i;
                              _screenshotsAnimationController.forward(from: 0);
                            });
                          },
                          onMouseExit: (i) {
                            setState(() {
                              _previousSelectedIndex = _selectedIndex;
                              _selectedIndex = -1;
                              _screenshotsAnimationController.forward(from: 0);

                            });
                          },
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
                          child: Stack(
                            children: [
                              Image.asset(
                                _previousSelectedIndex == -1
                                    ? widget.game.horizontalCapsuleAsset
                                    : widget.game
                                        .screenshotsBigger[_previousSelectedIndex],
                                fit: BoxFit.fitHeight,
                                width: 616,
                                height: 353,
                              ),
                              FadeTransition(
                                opacity: _screenshotsAnimation,
                                child: Image.asset(
                                  _selectedIndex == -1
                                      ? widget.game.horizontalCapsuleAsset
                                      : widget.game.screenshotsBigger[_selectedIndex],
                                  fit: BoxFit.fitHeight,
                                  width: 616,
                                  height: 353,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                  left: 940 - 3,
                  child: FadeTransition(
                      opacity: _detailsAnimation,
                      child: _GamePreview(game: widget.game)))
            ],
          ),
        ),
      ),
    );
  }
}
