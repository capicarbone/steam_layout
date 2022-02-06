import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class SectionContainer extends StatelessWidget {
  final Widget child;
  final double height;
  final Color? color;
  final Widget? leftChild;
  const SectionContainer(
      {Key? key,
      required this.child,
      this.color = Colors.black,
      this.leftChild = null,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      color: color,
      alignment: Alignment.topCenter,
      child: Stack(children: [
        Container(
          width: 1220,
          height: double.infinity,
          color: Colors.white.withOpacity(0.2),
          alignment: Alignment.centerRight,
          child: Container(
            width: 1033,
            height: double.infinity,
            color: Colors.white.withOpacity(0.4),
            child: child,
          ),
        ),
        if (leftChild != null) leftChild!,
      ]),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SectionContainer(
            child: Text("Header"),
            height: 104,
            color: Color(0xff171a21),
          ),
          SectionContainer(
            child: Text("Content"),
            height: 1921,
            color: Color(0xff1b2838),
            leftChild: Container(
              color: Colors.white.withOpacity(0.6),
              height: 1921,
              width: 210,
            ),
          ),
          SectionContainer(
            child: Text("Tredings | Streaming | Updates"),
            height: 2143,
            color: Color(0xff1b2838),
          ),
          SectionContainer(
            child: Text("Looking for recommendations"),
            height: 214,
          ),
          SectionContainer(
            child: Text("Footer"),
            height: 156,
            color: Color(0xff171a21),
          ),
        ],
      ),
    );
  }
}
