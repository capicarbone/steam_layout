import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class LimitedPromoBanner extends StatefulWidget {
  const LimitedPromoBanner({Key? key}) : super(key: key);

  @override
  State<LimitedPromoBanner> createState() => _LimitedPromoBannerState();
}

class _LimitedPromoBannerState extends State<LimitedPromoBanner> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.asset("webm_page_bg_english.webm")
      ..initialize().then((value) {
        _controller.setLooping(true);
        _controller.setVolume(0);
        _controller.play();
        setState(() {});
      });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OverflowBox(
      minHeight: 450,
      minWidth: 1850,
      maxHeight: 450,
      maxWidth: 1850,
      child: Container(
        // TODO add background image
        child: _controller.value.isInitialized ? VideoPlayer(_controller) : Container(),
      ),
    );
  }
}
