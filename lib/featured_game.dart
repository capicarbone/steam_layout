import 'package:flutter/material.dart';
import 'package:steam_flutter_layout/app_colors.dart';
import 'package:steam_flutter_layout/game_tag.dart';

import 'data/game.dart';

class FeaturedGame extends StatelessWidget {
  final Game game;
  const FeaturedGame({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xff0b151e),
          boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.black, offset: Offset(0, 0), blurRadius: 7)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 616,
            decoration: BoxDecoration(boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black,
                  offset: Offset(0, 0),
                  blurRadius: 10,
                  spreadRadius: 5)
            ]),
            child: Image.asset(game.horizontalCapsuleAsset),
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xff1c262f)),
              // border: Border.all(color: Colors.red)
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      height: 63,
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
                            child: Container(
                          height: 69,
                          child: Image.asset(game.screenshots[0]),
                        )),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Container(
                          height: 69,
                          child: Image.asset(game.screenshots[1]),
                        )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 13),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          height: 69,
                          child: Image.asset(game.screenshots[2]),
                        )),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Container(
                          height: 69,
                          child: Image.asset(game.screenshots[3]),
                        )),
                      ],
                    ),
                  ),
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
                        "Free To Play",
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
          ))
        ],
      ),
    );
  }
}
