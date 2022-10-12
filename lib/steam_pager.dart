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

class _ControlButton extends StatefulWidget {
  final leftDirection;
  const _ControlButton({Key? key, @required this.leftDirection})
      : super(key: key);

  @override
  State<_ControlButton> createState() => _ControlButtonState();
}

class _ControlButtonState extends State<_ControlButton> {
  var _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _hovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _hovered = false;
        });
      },
      child: Container(
        height: 108,
        width: 46,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          (_hovered)
              ? Color.fromRGBO(255, 255, 255, (widget.leftDirection) ? 0.3 : 0.0)
              : Color.fromRGBO(0, 0, 0, (widget.leftDirection) ? 0.3 : 0.0),
          (_hovered)
              ? Color.fromRGBO(255, 255, 255, (widget.leftDirection) ? 0.0 : 0.3)
              : Color.fromRGBO(0, 0, 0, (widget.leftDirection) ? 0.0 : 0.3),
        ], stops: [
          0.05,
          0.95
        ])),
        child: Center(
            child: Icon(
          (widget.leftDirection)
              ? Icons.keyboard_arrow_left_sharp
              : Icons.keyboard_arrow_right_sharp,
          color: Colors.white,
          size: 52,
        )),
      ),
    );
  }
}

class SteamPager extends StatefulWidget {
  final contentHeight;
  final List<Widget> pages;
  const SteamPager({Key? key, this.contentHeight = 352, required this.pages})
      : super(key: key);

  @override
  State<SteamPager> createState() => _SteamPagerState();
}

class _SteamPagerState extends State<SteamPager> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _InAnimation;
  late Animation<double> _OutAnimation;
  var _selectedIndex = 0;
  var _lastIndex = 0;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _InAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _OutAnimation = ReverseAnimation(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
                onTap: () {
                  setState(() {
                    _lastIndex = _selectedIndex;
                    _selectedIndex = (_selectedIndex - 1) % widget.pages.length;
                    _controller.forward(from: 0.0);
                  });
                },
                child: const _ControlButton(
                  leftDirection: true,
                )),
            Expanded(
                child: Container(
              height: widget.contentHeight,
              child: Stack(
                children: [
                  FadeTransition(
                    opacity: _OutAnimation,
                    child: widget.pages[_lastIndex],
                  ),
                  FadeTransition(
                    opacity: _InAnimation,
                    child: widget.pages[_selectedIndex],
                  ),
                ],
              ),
            )),
            GestureDetector(
              onTap: () {
                setState(() {
                  _lastIndex = _selectedIndex;
                  _selectedIndex = (_selectedIndex + 1) % widget.pages.length;
                  _controller.forward(from: 0.0);
                });
              },
              child: _ControlButton(leftDirection: false,),
            ),
          ],
        ),
        SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...widget.pages
                .asMap()
                .entries
                .map((e) => _PageMarker(active: e.key == _selectedIndex))
                .toList()
          ],
        )
      ],
    );
  }
}
