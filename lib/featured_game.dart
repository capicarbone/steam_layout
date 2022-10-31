import 'package:flutter/material.dart';
import 'package:steam_flutter_layout/app_colors.dart';
import 'package:steam_flutter_layout/game_tag.dart';

import 'data/game.dart';

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

class FeaturedGame extends StatefulWidget {
  final Game game;
  const FeaturedGame({Key? key, required this.game}) : super(key: key);

  @override
  State<FeaturedGame> createState() => _FeaturedGameState();
}

class _FeaturedGameState extends State<FeaturedGame> {
  int _selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 353,
      decoration: BoxDecoration(
          // border: Border.all(color: Color(0xff1c262f)),
          color: Color(0xff0b151e),
          boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.black, offset: Offset(0, 0), blurRadius: 7)
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
                child: Image.asset(_selectedIndex == -1
                    ? widget.game.horizontalCapsuleAsset
                    : widget.game.screenshots[_selectedIndex],
                  fit:BoxFit.fitWidth,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
