class Price {
  double basePrice;
  double offerPrice = 0;
  String currency = "USD";

  get currentPrice => offerPrice > 0 ? offerPrice : basePrice;

  get hasDiscount => offerPrice > 0;

  get discount => offerPrice / basePrice;

  get discountFormatted => "-${((discount * 100) as double).toStringAsFixed(0)}%";

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
  bool hasStreaming;
  // String usersReview;

  String get horizontalCapsuleAsset =>
      "images/games/$assetsFolder/capsule_616x353.jpg";
  String get horizontalSmallCapsuleAsset =>
      "images/games/$assetsFolder/capsule_231x87.jpg";
  String get verticalCapsuleAsset => "images/games/$assetsFolder/hero_capsule.jpg";
  List<String> get screenshots => [
        "images/games/$assetsFolder/screenshot1.jpg",
        "images/games/$assetsFolder/screenshot2.jpg",
        "images/games/$assetsFolder/screenshot3.jpg",
        "images/games/$assetsFolder/screenshot4.jpg",
      ];

  String get streamingScreenshot => "images/games/$assetsFolder/streaming.jpg";

  Game(
      {required this.name,
      required this.forWindows,
      required this.forMac,
      required this.price,
      required this.tags,
        required this.hasStreaming,
      // required this.usersReview,
      required this.assetsFolder});
}
