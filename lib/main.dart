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
  const SectionContainer({Key? key,
    required this.child,
  required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      color: Colors.black,
      alignment: Alignment.topCenter,
      child: Container(
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
          SectionContainer(child: Text("Header"), height: 104,),
          SectionContainer(child: Text("Content"), height: 1921,),
          SectionContainer(child: Text("Tredings | Streaming | Updates"), height: 2143,),
          SectionContainer(child: Text("Looking for recommendations"), height: 214,),
          SectionContainer(child: Text("Footer"), height: 156,),
        ],
      ),
    );

  }
}
