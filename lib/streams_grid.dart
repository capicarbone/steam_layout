import 'package:flutter/widgets.dart';

class StreamsGrid extends StatelessWidget {
  const StreamsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 472,
      child: GridView.count(
        childAspectRatio: 306 / 208,
        crossAxisSpacing: 5,
        crossAxisCount: 3,
        mainAxisSpacing: 8,
        children: List.generate(
            6,
            (index) => Container(
              color: Color(0xff323e4c),
                )),
      ),
    );
  }
}
