import 'package:flutter/widgets.dart';

class SectionTitle extends StatelessWidget {
  final String text;
  const SectionTitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: TextStyle(
          color: Color(0xffffffff),
          fontSize: 14,
          decoration: TextDecoration.none),
    );
  }
}
