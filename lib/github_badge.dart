import 'package:flutter/material.dart';

class GithubBadge extends StatelessWidget {
  final Widget child;
  const GithubBadge({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned(
          bottom: 12,
            right: 12,
            child: Container(
          decoration: BoxDecoration(
            color: Colors.black
          ),
          width: 30,
          height: 30,
              child: Column(
                children: [

                ],
              ),
        ))
      ],
    );
  }
}
