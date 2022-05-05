import 'package:flutter/material.dart';

class SimpleGameCard extends StatelessWidget {
  const SimpleGameCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            child: Container(color: Colors.blue),
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
                    "\$12.99",
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
}
