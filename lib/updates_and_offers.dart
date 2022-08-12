import 'package:flutter/widgets.dart';
import 'package:steam_flutter_layout/simple_game_card.dart';

import 'data/game.dart';

class UpdatesAndOffers extends StatelessWidget {
  final Game featuredGame;
  final List<Game> games;
  const UpdatesAndOffers(
      {Key? key, required this.featuredGame, required this.games})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 422,
      child: Row(
        children: [
          Container(
            width: 378,
            child: SimpleGameCard(
              game: featuredGame,
            ),
          ),
          Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: games
                    .map(
                      (e) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                            3,
                            (index) => Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(left: 10),
                                    height: 206,
                                    child: SimpleGameCard(
                                      game: e,
                                    ),
                                  ),
                                )),
                      ),
                    )
                    .toList()),
          )
        ],
      ),
    );
  }
}
