
import 'package:flutter/material.dart';

class HeaderItem extends StatelessWidget {
  final String text;
  const HeaderItem({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text.toUpperCase(),
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      padding: EdgeInsets.only(right: 14),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 44),
      height: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            children: [
              HeaderItem(text: "Steam"), // TODO to logo
              HeaderItem(text: "Store"),
              HeaderItem(text: "Community"),
              HeaderItem(text: "About"),
              HeaderItem(text: "Support")
            ],
          ),
          Positioned(
              top: 0,
              right: 0,
              child: Container(
                height: 23,
                width: 234,
                color: Colors.green,
              ))
        ],
      ),
    );
  }
}
