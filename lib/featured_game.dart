import 'package:flutter/material.dart';
import 'package:steam_flutter_layout/app_colors.dart';
import 'package:steam_flutter_layout/game_tag.dart';

class FeaturedGame extends StatelessWidget {
  const FeaturedGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xff0b151e),
          boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.black, offset: Offset(0, 0), blurRadius: 7)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 616,
            decoration:
                BoxDecoration(color: Colors.yellow, boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black,
                  offset: Offset(0, 0),
                  blurRadius: 10,
                  spreadRadius: 5)
            ]),
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xff1c262f)),
              // border: Border.all(color: Colors.red)
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      height: 63,
                      child: Text(
                        "Cybepunk 2077: Go to the space expansion",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(height: 1),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 13),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          height: 69,
                          color: Colors.blue,
                        )),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Container(
                          height: 69,
                          color: Colors.blue,
                        )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 13),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          height: 69,
                          color: Colors.blue,
                        )),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Container(
                          height: 69,
                          color: Colors.blue,
                        )),
                      ],
                    ),
                  ),
                  Text(
                    "Available now",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 21),
                  ),
                  Row(
                    children: [
                      GameTag(tag: "Top Seller"),
                      GameTag(tag: "Top Seller"),
                      GameTag(tag: "Top Seller")
                    ],
                  ),
                  Expanded(child: Container()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Free To Play",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: AppColors.highlightedText),
                      ),
                      Row(children: [
                        ...[Icons.window, Icons.apple, Icons.android].map((e) => Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Icon(e, color: AppColors.darkText, size: 17,),
                        ))
                      ],)
                    ],
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
