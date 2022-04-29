import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GameTag extends StatelessWidget {
  final String tag;
  const GameTag({Key? key, required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 2),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
        color: Color(0xff3c444b),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Text(
        "Top Seller",
        style: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: Colors.white, fontWeight: FontWeight.w300),
      ),
    );
  }
}
