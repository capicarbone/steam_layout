
import 'dart:html';

import 'package:steam_flutter_layout/data/game.dart';

class GamesProvider {

  static final games = [
    Game(
      name: "F1 22",
      price: Price(
        59.99
      ),
      for_mac: false,
      for_windows: true,
      assetsFolder: "f122",
      tags: ["Racing", "Sports", "Multiplayer", "VR"],
    )
  ];

  static List<Game> getRandomGames(int count) {
    return List<Game>.filled(count, games[0]);
  }
}