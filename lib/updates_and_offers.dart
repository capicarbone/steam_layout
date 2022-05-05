import 'package:flutter/widgets.dart';
import 'package:steam_flutter_layout/simple_game_card.dart';


class UpdatesAndOffers extends StatelessWidget {
  const UpdatesAndOffers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 422,
      child: Row(
        children: [
          Container(
            width: 378,
            child: SimpleGameCard(),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(3, (index) => Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      height: 206,
                      child: SimpleGameCard(),
                    ),
                  )),
                ),Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(3, (index) => Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      height: 206,
                      child: SimpleGameCard(),
                    ),
                  )),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
