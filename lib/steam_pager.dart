import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class _PageMarker extends StatelessWidget {
  final bool active;
  const _PageMarker({Key? key, this.active = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: active
                ? Colors.white.withOpacity(0.4)
                : Colors.white.withOpacity(0.2)),
        width: 15,
        height: 9,
      ),
    );
  }
}

class SteamPager extends StatelessWidget {
  final contentHeight;
  final List<Widget> pages;
  const SteamPager({Key? key, this.contentHeight = 352, required this.pages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 108,
              width: 46,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color.fromRGBO(0, 0, 0, 0.3),
                Color.fromRGBO(0, 0, 0, 0),
              ], stops: [
                0.05,
                0.95
              ])),
              child: Center(
                  child: Icon(
                Icons.keyboard_arrow_left_sharp,
                color: Colors.white,
                size: 52,
              )),
            ),
            Expanded(
                child: Container(
              height: contentHeight,
              child: pages[0],
            )),
            Container(
              height: 108,
              width: 46,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color.fromRGBO(0, 0, 0, 0),
                Color.fromRGBO(0, 0, 0, 0.3),
              ], stops: [
                0.05,
                0.95
              ])),
              child: Center(
                  child: Icon(
                Icons.keyboard_arrow_right_sharp,
                color: Colors.white,
                size: 52,
              )),
            ),
          ],
        ),
        SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _PageMarker(active: true,),
            _PageMarker(),
            _PageMarker(),
            _PageMarker(),
            _PageMarker(),
            _PageMarker(),
          ],
        )
      ],
    );
  }
}
