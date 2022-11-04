import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'data/game.dart';

class GameTag extends StatelessWidget {
  final String tag;
  final bool lightBackground;
  const GameTag({Key? key, required this.tag, this.lightBackground = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 2),
      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
      decoration: BoxDecoration(
        color: lightBackground ? Color(0xff50687a) : Color(0xff3c444b) ,
        borderRadius: BorderRadius.circular(2),
      ),
      child: Text(
        tag,
        style: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: Colors.white, fontWeight: FontWeight.w300),
      ),
    );
  }
}

class GameName extends StatelessWidget {
  final String name;
  const GameName({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      height: 25,
      child: Text(
        name,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.displayMedium!.copyWith(
            fontSize: 21, color: Color.fromRGBO(38, 54, 59, 1)),
      ),
    );
  }
}

class UsersReview extends StatelessWidget {
  const UsersReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
      decoration: BoxDecoration(
          color: Color(0xff516b7d),
          borderRadius: BorderRadius.circular(2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Overall user review:",
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: AppColors.darkText, fontSize: 12),
          ),
          Text(
            "Mostly Positive",
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: AppColors.highlightedText, fontSize: 12),
          )
        ],
      ),
    );
  }
}