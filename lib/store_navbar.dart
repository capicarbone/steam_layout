
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class _NavbarItem extends StatelessWidget {
  final String text;
  const _NavbarItem({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(text, style: TextStyle(fontSize: 13, decoration: TextDecoration.none)),
    );
  }
}


class StoreNavbar extends StatelessWidget {
  const StoreNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 44),
      child: Container(
        color: Colors.blue,
        width: double.infinity,
        height: 35,
        child: Row(
          children: [
            _NavbarItem(text: "Your Store"),
            _NavbarItem(text: "New & Noteworthy"),
            _NavbarItem(text: "Categories"),
            _NavbarItem(text: "Points Shop"),
            _NavbarItem(text: "News"),
            _NavbarItem(text: "Labs"),
            Expanded(child: Container(),),
            Container(
              height: 30,
              width: 203,
              color: Colors.blueGrey,
            ),
            SizedBox(width: 3,)
          ],
        ),
      ),
    );
  }
}
