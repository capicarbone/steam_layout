
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class _PageMarker extends StatelessWidget {
  const _PageMarker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: Container(
        width: 15,
        height: 9,
        color: Color(0xffffffff),
      ),
    );
  }
}


class SteamPager extends StatelessWidget {
  const SteamPager({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 108,
              width: 46,
              color: Colors.black,
            ),
            Expanded(child: Container(height:352,color: Colors.black.withOpacity(0.5),)),
            Container(
              height: 108,
              width: 46,
              color: Colors.black,
            ),
          ],
        ),
        SizedBox(height: 12,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          _PageMarker(),
            _PageMarker(),
            _PageMarker(),
            _PageMarker(),
            _PageMarker(),
            _PageMarker(),


        ],)
      ],
    );
  }
}
