class Game {
  String name;
  bool for_windows;
  bool for_mac;
  String base_price;
  String assetsFolder;
  List<String> tags;
  // String usersReview;

  String get horizontal_capsule_asset => "games/$assetsFolder/capsule_616x353.jpg";
  String get horizontal_small_capsule_asset => "games/$assetsFolder/capsule_231x87.jpg";
  String get vertical_capsule_asset => "games/$assetsFolder/hero_capsule.jpg";
  List<String> get screenshots => [
    "games/$assetsFolder/screenshot1.jpg",
    "games/$assetsFolder/screenshot2.jpg",
    "games/$assetsFolder/screenshot3.jpg",
    "games/$assetsFolder/screenshot4.jpg",
    "games/$assetsFolder/screenshot5.jpg",
  ];

  Game(
      {required this.name,
      required this.for_windows,
      required this.for_mac,
      required this.base_price,
      required this.tags,
      // required this.usersReview,
        required this.assetsFolder
      });
}
