import 'dart:html';

import 'package:steam_flutter_layout/data/game.dart';

class GamesProvider {
  static final games = [
    Game(
      name: "F1 22",
      price: Price(59.99, 29.99),
      forMac: false,
      forWindows: true,
      hasStreaming: false,
      assetsFolder: "f122",
      tags: ["Racing", "Sports", "Multiplayer", "VR"],
    ),
    Game(
      name: "Marvel’s Spider-Man Remastered",
      price: Price(59.99),
      forMac: false,
      forWindows: true,
      hasStreaming: true,
      assetsFolder: "spiderman",
      tags: ["Superhero", "Action", "Open World", "Singleplayer"],
    ),
    Game(
      name: "Street Fighter V",
      price: Price(59.99, 29.99),
      forMac: false,
      hasStreaming: false,
      forWindows: true,
      assetsFolder: "sf",
      tags: ["Fighting", "Action", "2D Fighter", "Multiplayer", "Arcade"],
    ),
    Game(
      name: "Project CARS 2",
      price: Price(59.99),
      forMac: false,
      hasStreaming: false,
      forWindows: true,
      assetsFolder: "pc2",
      tags: ["Racing", "Driving", " Automobile Sim", "Simulation"],
    ),
    Game(
      name: "Crusader Kings III",
      price: Price(49.99, 29.99),
      forMac: true,
      forWindows: true,
      hasStreaming: true,
      assetsFolder: "ckIII",
      tags: ["Strategy", "RPG", "Grand Strategy", "Medieval", 'War'],
    ),
    Game(
      name: "STAR WARS Jedi: Fallen Order™",
      price: Price(59.99),
      forMac: false,
      forWindows: true,
      hasStreaming: true,
      assetsFolder: "jedi",
      tags: ["Action-Adventure", "Souls-like", "Third Person", "Action"],
    ),
    Game(
      name: "Cyberpunk 2077",
      price: Price(59.99, 29.99),
      forMac: false,
      forWindows: true,
      hasStreaming: true,
      assetsFolder: "cyberpunk",
      tags: ["Cyberpunk", "Open World", "RPG", "Nudity", "Sci-fi"],
    ),
    Game(
      name: "Age of Empires IV",
      price: Price(59.99, 29.99),
      forMac: false,
      forWindows: true,
      hasStreaming: true,
      assetsFolder: "aoe4",
      tags: ["Strategy", "RTS", "Multiplayer", "Medieval", "War"],
    ),
    Game(
      name: "Assetto Corsa Competizione",
      price: Price(39.99, 29.99),
      forMac: false,
      forWindows: true,
      assetsFolder: "acc",
      hasStreaming: true,
      tags: ["Racing", "Automobile Sim", "Simulation", "VR", "Sports"],
    ),
    Game(
      name: "Microsoft Flight Simulator",
      price: Price(59.99),
      forMac: false,
      forWindows: true,
      hasStreaming: true,
      assetsFolder: "fs2020",
      tags: ["Simulation", "Flight", "Open World", "Realistic", "VR"],
    ),
  ];

  static List<Game> getMany(int count, {hasStreaming: false}) {
    games.shuffle();
    if (hasStreaming) {
      return games
          .where((element) => element.hasStreaming == true)
          .toList()
          .sublist(0, count);
    }
    return games.sublist(0, count);
  }

  static getOne() {
    return getMany(1)[0];
  }
}
