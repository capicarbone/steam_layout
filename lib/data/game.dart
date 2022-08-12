class Price {
  double base_price;
  double offer_price = 0;
  String currency = "USD";

  get current_price => offer_price > 0 ? offer_price : base_price;

  get has_discount => offer_price > 0;

  get discount => offer_price / base_price;

  get discount_formatted => "-$discount%";

  get base_price_formatted => "\$$base_price";
  get offer_price_formatted => "\$$offer_price";
  get current_price_formatted => "\$$current_price";



  Price(this.base_price, [this.offer_price = 0, this.currency = "USD"]);
}

class Game {
  String name;
  bool for_windows;
  bool for_mac;
  Price price;
  String assetsFolder;
  List<String> tags;
  // String usersReview;

  String get horizontal_capsule_asset =>
      "games/$assetsFolder/capsule_616x353.jpg";
  String get horizontal_small_capsule_asset =>
      "games/$assetsFolder/capsule_231x87.jpg";
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
      required this.price,
      required this.tags,
      // required this.usersReview,
      required this.assetsFolder});
}
