import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:steam_flutter_layout/app_colors.dart';
import 'package:steam_flutter_layout/data/games_provider.dart';

import 'data/game.dart';
import 'game_tag.dart';

class _GameItem extends StatelessWidget {
  final Game game;
  final bool selected;
  const _GameItem({Key? key, required this.game, this.selected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      height: 69,
      color: Color(0xff93b7cf).withOpacity(selected ? 1 : 0),
      child: Container(
        margin: EdgeInsets.only(right: 14),
        color: Color(0x00000000).withOpacity(selected ? 0.0 : 0.2),
        child: Row(
          children: [
            Container(
              width: 184,
              child: Image.asset(game.horizontalSmallCapsuleAsset),
            ),
            Container(
              width: 324,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      game.name,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(
                              fontSize: 15,
                              color: selected
                                  ? Color(0xff10161b)
                                  : Color(0xffc7d5e0)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.android,
                          size: 15,
                          color: Color.fromRGBO(56, 73, 89, 1),
                        ),
                        if (game.price.hasDiscount)
                        Container(
                          color: AppColors.green,
                          height: 18,
                          width: 40,
                          child: Center(
                            child: Text(
                              game.price.discountFormatted,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                      color: AppColors.discountTagText,
                                      fontSize: 14),
                            ),
                          ),
                        )
                      ],
                    ),
                    Text(
                      game.tags
                          .asMap()
                          .map((key, value) => MapEntry(key,
                              key != game.tags.length - 1 ? "$value, " : value))
                          .values
                          .toList()
                          .reduce((value, element) => value + element),
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(
                              fontSize: 12,
                              color: selected
                                  ? Color(0xff384959)
                                  : Color.fromRGBO(56, 73, 89, 1)),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (game.price.hasDiscount)
                Text(
                  game.price.basePriceFormatted,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: selected ? Color(0xff7193a6) : Color(0xff7193a6),
                      fontSize: 11,
                      decoration: TextDecoration.lineThrough),
                ),
                Text(
                  game.price.currentPriceFormatted,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontSize: 13,
                      color: selected ? Color(0xff263645) : Color(0xffacdbf5)),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class _GameList extends StatelessWidget {
  final List<Game> games;
  const _GameList({Key? key, required this.games}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(right: 14),
          padding: EdgeInsets.only(right: 5),
          height: 36,
          color: Color(0x00000000).withOpacity(0.2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Text(
                  "See more:",
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(color: Color(0xffffffff), fontSize: 12),
                ),
              ),
              Container(
                width: 109,
                height: 26,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white.withOpacity(0.4)),
                    borderRadius: BorderRadius.circular(3)),
                child: Center(
                  child: Text(
                    "New releases",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: Color(0xffffffff), fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
        ...games
            .asMap()
            .map((key, value) => MapEntry(
                key,
                _GameItem(
                  game: value,
                  selected: key == 0,
                )))
            .values
            .toList()
        // _GameItem(
        //   selected: true,
        // ),
        // _GameItem(),
        // _GameItem(),
        // _GameItem(),
        // _GameItem(),
        // _GameItem(),
        // _GameItem(),
        // _GameItem(),
        // _GameItem(),
        // _GameItem(),
      ],
    );
  }
}

class _GamePreview extends StatelessWidget {
  final Game game;
  const _GamePreview({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff93b7cf),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16, bottom: 5, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                game.name,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontSize: 21, color: Color.fromRGBO(38, 54, 59, 1)),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
              decoration: BoxDecoration(
                  color: Color(0xff516b7d),
                  borderRadius: BorderRadius.circular(2)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Overall user review:",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: AppColors.darkText, fontSize: 12),
                  ),
                  Text(
                    "Mostly Positive",
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: AppColors.highlightedText, fontSize: 12),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(children: game.tags.map((e) => GameTag(
              tag: e,
              lightBackground: true,
            ),).toList()),
            SizedBox(
              height: 6,
            ),
            Column(
              children: game.screenshots.map((e) => Container(
                height: 150,
                width: 274,
                color: Colors.blue,
                margin: EdgeInsets.only(bottom: 3),
                child: Image.asset(e, fit: BoxFit.cover,),
              ),).toList(),
            )
          ],
        ),
      ),
    );
  }
}

class GamesSample extends StatelessWidget {
  const GamesSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var games = GamesProvider.getMany(10);
    return Padding(
      padding: const EdgeInsets.only(top: 9),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 632,
            child: _GameList(
              games: games,
            ),
          ),
          Expanded(child: _GamePreview(game: games[0]))
        ],
      ),
    );
  }
}
