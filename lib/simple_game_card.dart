import 'package:flutter/material.dart';

import 'data/game.dart';

class SimpleGameCard extends StatelessWidget {
  final Game game;
  const SimpleGameCard({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  end: Alignment(-1.0, -2),
                  begin: Alignment(1.0, 2),
                  colors: [
                    Color.fromRGBO(64, 121, 153, 1),
                    Color.fromRGBO(42, 62, 89, 1)
                  ],
                  stops: [
                    0.05,
                    0.95
                  ]),
              boxShadow: <BoxShadow>[
                BoxShadow(color: Colors.black, offset: Offset(0, 0), blurRadius: 4)
              ]),
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  constraints.maxHeight > constraints.maxWidth ? game.vertical_capsule_asset : game.horizontal_capsule_asset,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                  width: double.infinity,
                ),
              ),
              Container(
                height: 27,
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      color: Color(0xff2f556d),
                      height: 17,
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        game.price.current_price_formatted,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(fontSize: 13, color: Color(0xffacdbf5)),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }
    );
  }
}
