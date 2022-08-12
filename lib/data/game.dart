class Price {
  double basePrice;
  double offerPrice = 0;
  String currency = "USD";

  get currentPrice => offerPrice > 0 ? offerPrice : basePrice;

  get hasDiscount => offerPrice > 0;

  get discount => offerPrice / basePrice;

  get discountFormatted => "-$discount%";

  get basePriceFormatted => "\$$basePrice";
  get offerPriceFormatted => "\$$offerPrice";
  get currentPriceFormatted => "\$$currentPrice";



  Price(this.basePrice, [this.offerPrice = 0, this.currency = "USD"]);
}

class Game {
  String name;
  bool forWindows;
  bool forMac;
  Price price;
  String assetsFolder;
  List<String> tags;
  // String usersReview;

  String get horizontalCapsuleAsset =>
      "games/$assetsFolder/capsule_616x353.jpg";
  String get horizontalSmallCapsuleAsset =>
      "games/$assetsFolder/capsule_231x87.jpg";
  String get verticalCapsuleAsset => "games/$assetsFolder/hero_capsule.jpg";
  List<String> get screenshots => [
        "games/$assetsFolder/screenshot1.jpg",
        "games/$assetsFolder/screenshot2.jpg",
        "games/$assetsFolder/screenshot3.jpg",
        "games/$assetsFolder/screenshot4.jpg",
      ];

  Game(
      {required this.name,
      required this.forWindows,
      required this.forMac,
      required this.price,
      required this.tags,
      // required this.usersReview,
      required this.assetsFolder});
}
