

import 'package:flutter/widgets.dart';

class ContentPadding extends StatelessWidget {
  final Widget child;
  const ContentPadding({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 44), child: child,);
  }
}
