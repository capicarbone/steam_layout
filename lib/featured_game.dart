import 'package:flutter/material.dart';
import 'package:steam_flutter_layout/app_colors.dart';
import 'package:steam_flutter_layout/game_tag.dart';

import 'data/game.dart';

class _GameDetails extends StatelessWidget {
  final Game game;
  const _GameDetails({Key? key, required this.game}) : super(key: key);

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
                  Container(
                    child: Image.asset(
                      game.screenshots[0],
                      height: 69,
                      width: 162,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Container(
                    child: Image.asset(
                      game.screenshots[1],
                      height: 69,
                      width: 162,
                      fit: BoxFit.cover,
                    ),
                  )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 13),
              child: Row(
                children: [
                  Container(
                    child: Image.asset(
                      game.screenshots[2],
                      height: 69,
                      width: 162,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Container(
                    child: Image.asset(
                      game.screenshots[3],
                      height: 69,
                      width: 162,
                      fit: BoxFit.cover,
                    ),
                  )),
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

class FeaturedGame extends StatelessWidget {
  final Game game;
  const FeaturedGame({Key? key, required this.game}) : super(key: key);

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
            children: [_GameDetails(game: game)],
          ),
          ClipRect(
            child: Container(
              width: 700,
              alignment: Alignment.centerLeft,
              child: Container(
                width: 616,
                decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black,
                      offset: Offset(0, 0),
                      blurRadius: 10,
                      spreadRadius: 5)
                ]),
                child: Image.asset(game.horizontalCapsuleAsset),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
