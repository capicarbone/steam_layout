import 'package:flutter/widgets.dart';

class SectionTitle extends StatelessWidget {
  final String text;
  final List<String> links;
  const SectionTitle({Key? key, required this.text, this.links = const []}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text.toUpperCase(),
              style: TextStyle(
                  color: Color(0xffffffff),
                  fontSize: 14,
                  decoration: TextDecoration.none),
            ),
            Row(
              children: [
                ...links.map((e) => Text(e.toUpperCase(), style: TextStyle(color: Color(0xffffffff), fontSize: 12),))
              ],
            )
          ],
        ),
        SizedBox(height: 14,),
      ],
    );
  }
}
