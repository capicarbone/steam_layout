import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class _StreamItem extends StatelessWidget {
  const _StreamItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
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
              height: 143,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    "games/acc/streaming.jpg",
                    fit: BoxFit.fitWidth,
                    width: constraints.maxWidth,
                  ),
                  Positioned(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(color: Colors.black),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 7),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromRGBO(169, 72, 71, 1)),
                            height: 10,
                            width: 10,
                          ),
                          Text(
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(fontSize: 12, color: Colors.white, letterSpacing: 1),
                              "Live".toUpperCase()),
                        ],
                      ),
                    ),
                    top: 0,
                    left: 0,
                  ),
                  Image.asset("images/play_icon80.png")
                ],
              ),
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
                        child: Icon(
                          Icons.people,
                          color: Color(0xffc7d5e0),
                          size: 16,
                        ),
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
    });
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
