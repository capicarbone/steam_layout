import 'package:flutter/material.dart';
import 'package:steam_flutter_layout/app_colors.dart';
import 'package:steam_flutter_layout/game_tag.dart';

import 'data/game.dart';

class _PriceTag extends StatelessWidget {
  final Price price;
  const _PriceTag({Key? key,required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 7),
            color: Color(0xff4c6b22),
            child: Text(
              price.discountFormatted,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontSize: 26,
                  color: AppColors.discountTagText,
                  fontWeight: FontWeight.w300),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 7),
            color: Color(0xff0c2e3d),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  price.basePriceFormatted,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontWeight: FontWeight.w300,
                      fontSize: 11,
                      decoration: TextDecoration.lineThrough,
                      color: Color(0xff7193a6)),
                ),
                Text(
                  "${price.offerPriceFormatted} ${price.currency}".toUpperCase(),
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontWeight: FontWeight.w300,
                      fontSize: 13,
                      color: Color(0xffacdbf5)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _GameSmallFormat extends StatelessWidget {
  final Game game;
  const _GameSmallFormat({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: <BoxShadow>[
        BoxShadow(color: Colors.black, offset: Offset(0, 0), blurRadius: 5)
      ]),
      child: Column(
        children: [
          Container(
            height: 143,
            child: Image.asset(
              game.horizontalCapsuleAsset,
              fit: BoxFit.cover,
              width: double.infinity,
              alignment: Alignment.topCenter,

            ),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.all(5),
            color: Color(0xffafdcf4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Today's deal!",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(fontSize: 11, color: Color(0xff283846)),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        "11 days",
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  fontSize: 10,
                                  color: Color(0xffc4e4f2),
                                ),
                      ),
                      color: Color(0xff4f95bd),
                    )
                  ],
                ),
                _PriceTag(price: game.price,)
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class _Game extends StatelessWidget {
  final Game game;
  const _Game({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 11),
      decoration: BoxDecoration(boxShadow: <BoxShadow>[
        BoxShadow(color: Colors.black, offset: Offset(0, 0), blurRadius: 5)
      ]),
      child: Column(
        children: [
          Container(
            height: 277,
            width: double.infinity,
            child: Image.asset(game.verticalCapsuleAsset, fit: BoxFit.cover, alignment: Alignment.topCenter),
          ),
          Expanded(
              child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: Color(0xff1c6f95),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Weekend deal'.toUpperCase(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  "Offers end 7 Fed @ 1:00pm",
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontSize: 12),
                ),
                _PriceTag(price: game.price,)
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class OffersBanner extends StatelessWidget {
  final List<Game> games;
  const OffersBanner({Key? key, required this.games}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          // Column 1
          Expanded(
              child: _Game(
            game: games[0],
          )),
          // Column 2
          Expanded(
              child: _Game(
            game: games[1],
          )),
          // Column 3
          Expanded(
            child: Container(
              child: Column(
                children: [
                  Expanded(
                      child: _GameSmallFormat(
                    game: games[2],
                  )),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                      child: _GameSmallFormat(
                    game: games[3],
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
