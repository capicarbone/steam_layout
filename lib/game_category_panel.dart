
import 'dart:math' as math;
import 'package:flutter/material.dart';

import 'data/game.dart';

class GameCategoryPanel extends StatelessWidget {
  final String text;
  final List<Game> games;
  final Color color;
  const GameCategoryPanel({Key? key, required this.text, required this.games, required this.color})
      : super(key: key);

  static const MOSAIC_HEIGHT = 380.0;
  static const LEVELS_HEIGHT = [MOSAIC_HEIGHT * 0.4, MOSAIC_HEIGHT * 0.25, MOSAIC_HEIGHT * 0.15, MOSAIC_HEIGHT * 0.2];

  double get _mosaicWidth {

    var levelsWidth = [
      ((LEVELS_HEIGHT[0] / 87 ) * 231) + 100,
      ((LEVELS_HEIGHT[1] / 87 ) * 231) * 2,
      ((LEVELS_HEIGHT[2] / 87 ) * 231) * 2 + 50,
      ((LEVELS_HEIGHT[3] / 87 ) * 231),
    ];

    levelsWidth.sort( (a, b) => (b - a).toInt());

    return levelsWidth[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 223,
      decoration: BoxDecoration(
        // color: Colors.blue,
        borderRadius: BorderRadius.circular(3),
        // boxShadow: <BoxShadow>[
        //   BoxShadow(color: Colors.black, offset: Offset(0, 0), blurRadius: 4)
        // ]
      ),
      child: ClipRect(
        child: OverflowBox(
          maxHeight: MOSAIC_HEIGHT,
          // minHeight: 288,
          alignment: Alignment.topCenter,
          child: Stack(
            children: [
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..rotateZ(30 * -math.pi / 180)
                  ..setEntry(3, 0, 0.0005)
                  ..setEntry(3, 1, -0.0015)
                  ..setTranslationRaw(-60, -80, 0),

                child: Container(
                  width: _mosaicWidth,
                  height: MOSAIC_HEIGHT,
                  // color: Colors.red,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: LEVELS_HEIGHT[0],
                        // color: Colors.green,
                        child: OverflowBox(
                          alignment: Alignment.centerLeft,
                          maxWidth: _mosaicWidth,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                fit: BoxFit.fitHeight,
                                games[0].horizontalCapsuleAsset,
                                height: LEVELS_HEIGHT[0],
                              ),
                              SizedBox(
                                width: 100,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: LEVELS_HEIGHT[1],
                        // color: Colors.green,
                        child: OverflowBox(
                          alignment: Alignment.centerLeft,
                          maxWidth: _mosaicWidth,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // SizedBox(
                              //   width: 35,
                              // ),
                              Image.asset(
                                games[1].horizontalSmallCapsuleAsset,
                                height: LEVELS_HEIGHT[1],
                                fit: BoxFit.fitHeight,
                              ),
                              Image.asset(
                                games[2].horizontalSmallCapsuleAsset,
                                height: LEVELS_HEIGHT[1],
                                fit: BoxFit.fitHeight,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: LEVELS_HEIGHT[2],
                        // color: Colors.green,
                        child: OverflowBox(
                          alignment: Alignment.centerLeft,
                          maxWidth: _mosaicWidth,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                games[3].horizontalSmallCapsuleAsset,
                                height: LEVELS_HEIGHT[2],
                              ),
                              Image.asset(
                                games[4].horizontalSmallCapsuleAsset,
                                height: LEVELS_HEIGHT[2],
                              ),
                              SizedBox(width: 50,)
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: LEVELS_HEIGHT[3],
                        // color: Colors.green,
                        child: OverflowBox(
                          alignment: Alignment.centerLeft,
                          maxWidth: _mosaicWidth,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // SizedBox(width: 100,),
                              Image.asset(
                                games[5].horizontalSmallCapsuleAsset,
                                height: LEVELS_HEIGHT[0],
                              ),

                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        color,
                        color.withAlpha(0),
                      ],
                      stops: [
                        0.45,
                        1
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    )
                ),
              ),
              Center(
                  child: Text(
                    text.toUpperCase(),
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}