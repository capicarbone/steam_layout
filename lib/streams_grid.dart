import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class _StreamItem extends StatelessWidget {
  const _StreamItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xff323e4c),
          boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.black, blurRadius: 5)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: Colors.blue,
            height: 143,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Forza Horizon 5",
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontSize: 13, color: Color(0xffc7d5e0)),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: Icon(Icons.people, color: Color(0xffc7d5e0), size: 16,),
                    ),
                    Text("1,322",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(fontSize: 13, color: Color(0xffc7d5e0)))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class StreamsGrid extends StatelessWidget {
  const StreamsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 472,
      child: GridView.count(
        clipBehavior: Clip.none,
        childAspectRatio: 306 / 208,
        crossAxisSpacing: 5,
        crossAxisCount: 3,
        mainAxisSpacing: 8,
        children: List.generate(6, (index) => _StreamItem()),
      ),
    );
  }
}
