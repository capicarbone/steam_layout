import 'dart:async';

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
        width: 45,
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

  static const SECONDS_PER_PAGE = 5;
  final contentHeight;
  final bool automatic;
  final List<Widget> pages;
  const SteamPager({Key? key, this.contentHeight = 352, this.automatic = false, required this.pages})
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
  Timer? countdownTimer;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _InAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _OutAnimation = ReverseAnimation(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    if (widget.automatic)
      countdownTimer = Timer.periodic(Duration(seconds: SteamPager.SECONDS_PER_PAGE), autoUpdate);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void autoUpdate(timer) {
        setState(() {
      moveForward();
    });
  }

  void moveForward() {
    _lastIndex = _selectedIndex;
    _selectedIndex = (_selectedIndex + 1) % widget.pages.length;
    _controller.forward(from: 0.0);
  }

  void moveBackward() {
    _lastIndex = _selectedIndex;
    _selectedIndex = (_selectedIndex - 1) % widget.pages.length;
    _controller.forward(from: 0.0);
  }

  void restartTimer(){
    if (null != countdownTimer){
      countdownTimer!.cancel();
      countdownTimer = Timer.periodic(Duration(seconds: SteamPager.SECONDS_PER_PAGE), autoUpdate);
    }

  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return Container(
      width: 1030,
      child: Column(
        children: [
          Stack(
            children: [
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          restartTimer();
                          moveBackward();
                        });
                      },
                      child: const _ControlButton(
                        leftDirection: true,
                      )),
                  Expanded(child: Container(height: widget.contentHeight,)),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        restartTimer();
                        moveForward();
                      });
                    },
                    child: _ControlButton(leftDirection: false,),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(width: 45,),
                  Expanded(
                      child: MouseRegion(
                        onEnter: (_) => countdownTimer?.cancel(),
                        onExit: (_) => restartTimer(),
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
                        ),
                      )),
                  Container(width: 45,),
                ],
              )
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
      ),
    );
  }
}
