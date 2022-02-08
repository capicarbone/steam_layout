
import 'package:flutter/widgets.dart';

class _GameItem extends StatelessWidget {
  final bool selected;
  const _GameItem({Key? key, this.selected = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      height: 69,
      color: Color(0x00000000).withOpacity(0.5),
    );
  }
}


class _GameList extends StatelessWidget {
  const _GameList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 36,
          color: Color(0x00000000).withOpacity(0.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("See more:", style: TextStyle(color: Color(0xffffffff), fontSize: 12),),
              Text("New releases", style: TextStyle(color: Color(0xffffffff), fontSize: 12),),
            ],
          ),
        ),
        _GameItem(),
        _GameItem(),
        _GameItem(),
        _GameItem(),
        _GameItem(),
        _GameItem(),
        _GameItem(),
        _GameItem(),
        _GameItem(),
        _GameItem(),
      ],
    );
  }
}

class _GamePreview extends StatelessWidget {
  const _GamePreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 736, // TODO remove
      color: Color(0xff93b7cf),
    );
  }
}



class GamesSample extends StatelessWidget {
  const GamesSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(width: 632, child: _GameList(),),
        Expanded(child: _GamePreview())
      ],
    );
  }
}
