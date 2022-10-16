import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:steam_flutter_layout/app_colors.dart';
import 'package:steam_flutter_layout/data/games_provider.dart';

import 'data/game.dart';
import 'game_tag.dart';

class _SelectionModel {
  final int selectedIndex;
  final int previousSelectedIndex;

  const _SelectionModel(this.selectedIndex, this.previousSelectedIndex);
}

class GamesSampleModel
    extends InheritedNotifier<ValueNotifier<_SelectionModel>> {
  GamesSampleModel({required super.child, required super.notifier});

  static _SelectionModel of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<GamesSampleModel>()!
        .notifier!
        .value;
  }

  static void updateSelectedIndex(BuildContext context, int newIndex) {
    var notifier = context
        .dependOnInheritedWidgetOfExactType<GamesSampleModel>()!
        .notifier!;

    var newValue =
        _SelectionModel(newIndex, notifier.value.previousSelectedIndex);
    notifier.value = newValue;
  }

  static void updatePreviousSelectedIndex(BuildContext context, int newIndex) {
    var notifier = context
        .dependOnInheritedWidgetOfExactType<GamesSampleModel>()!
        .notifier!;

    var newValue = _SelectionModel(notifier.value.selectedIndex, newIndex);
    notifier.value = newValue;
  }
}

class _GameItem extends StatelessWidget {
  final int itemIndex;
  final Game game;
  final bool selected;
  const _GameItem(
      {Key? key,
      required this.game,
      required this.itemIndex,
      this.selected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        GamesSampleModel.updateSelectedIndex(context, itemIndex);
      },
      onExit: (_) {
        GamesSampleModel.updatePreviousSelectedIndex(context, itemIndex);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 5),
        height: 69,
        decoration: BoxDecoration(
          color: Color(0xff93b7cf).withOpacity(selected ? 1 : 0),
        ),
        child: Row(
          children: [
            Image.asset(game.horizontalSmallCapsuleAsset,
                width: 184, fit: BoxFit.fill),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(right: 14),
                decoration: BoxDecoration(
                  color: Color(0x00000000).withOpacity(selected ? 0.0 : 0.2),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 324,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 7),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              game.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                      fontSize: 15,
                                      color: selected
                                          ? Color(0xff10161b)
                                          : Color(0xffc7d5e0)),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.android,
                                  size: 15,
                                  color: Color.fromRGBO(56, 73, 89, 1),
                                ),
                                if (game.price.hasDiscount)
                                  Container(
                                    color: AppColors.green,
                                    height: 18,
                                    width: 40,
                                    child: Center(
                                      child: Text(
                                        game.price.discountFormatted,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium!
                                            .copyWith(
                                                color:
                                                    AppColors.discountTagText,
                                                fontSize: 14),
                                      ),
                                    ),
                                  )
                              ],
                            ),
                            Text(
                              game.tags
                                  .asMap()
                                  .map((key, value) => MapEntry(
                                      key,
                                      key != game.tags.length - 1
                                          ? "$value, "
                                          : value))
                                  .values
                                  .toList()
                                  .reduce((value, element) => value + element),
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                      fontSize: 12,
                                      color: selected
                                          ? Color(0xff384959)
                                          : Color.fromRGBO(56, 73, 89, 1)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (game.price.hasDiscount)
                          Text(
                            game.price.basePriceFormatted,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                    color: selected
                                        ? Color(0xff7193a6)
                                        : Color(0xff7193a6),
                                    fontSize: 11,
                                    decoration: TextDecoration.lineThrough),
                          ),
                        Text(
                          game.price.currentPriceFormatted,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                  fontSize: 13,
                                  color: selected
                                      ? Color(0xff263645)
                                      : Color(0xffacdbf5)),
                        ),
                      ],
                    ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GameList extends StatelessWidget {
  final List<Game> games;
  const _GameList({Key? key, required this.games}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var selectedIndex = GamesSampleModel.of(context).selectedIndex;
    return GestureDetector(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(right: 14),
            padding: EdgeInsets.only(right: 5),
            height: 36,
            color: Color(0x00000000).withOpacity(0.2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Text(
                    "See more:",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: Color(0xffffffff), fontSize: 12),
                  ),
                ),
                Container(
                  width: 109,
                  height: 26,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white.withOpacity(0.4)),
                      borderRadius: BorderRadius.circular(3)),
                  child: Center(
                    child: Text(
                      "New releases",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(color: Color(0xffffffff), fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ...games
              .asMap()
              .map((key, value) => MapEntry(
                  key,
                  _GameItem(
                    game: value,
                    itemIndex: key,
                    selected: key == selectedIndex,
                  )))
              .values
              .toList()
        ],
      ),
    );
  }
}

class _GamePreview extends StatefulWidget {
  final Game game;
  final bool fadeout;
  final bool fadein;
  _GamePreview({Key? key, required this.game, this.fadeout = false, this.fadein = false})
      : super(key: key);

  @override
  State<_GamePreview> createState() => _GamePreviewState();
}

class _GamePreviewState extends State<_GamePreview>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    if (widget.fadeout) _animation = ReverseAnimation(_animation);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.fadein || widget.fadeout){
      _controller.forward(from: 0);
    } else{
      _controller.value = 1;
    }

    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16, bottom: 5, top: 20),
      child: FadeTransition(
        opacity: _animation,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              height: 25,
              child: Text(
                widget.game.name,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontSize: 21, color: Color.fromRGBO(38, 54, 59, 1)),
              ),
            ),
            Container(
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
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(
                            color: AppColors.highlightedText, fontSize: 12),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
                children: widget.game.tags
                    .map(
                      (e) => GameTag(
                        tag: e,
                        lightBackground: true,
                      ),
                    )
                    .toList()),
            SizedBox(
              height: 6,
            ),
            Column(
              children: widget.game.screenshots
                  .map(
                    (e) => Container(
                      height: 150,
                      width: 274,
                      margin: EdgeInsets.only(bottom: 3),
                      decoration: BoxDecoration(),
                      child: Image.asset(
                        e,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}

class GamesSample extends StatelessWidget {
  const GamesSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var games = GamesProvider.getMany(10);
    return GamesSampleModel(
      notifier: ValueNotifier<_SelectionModel>(_SelectionModel(0, 0)),
      child: Padding(
        padding: const EdgeInsets.only(top: 9),
        child: LayoutBuilder(builder: (context, constraints) {
          // Used a stack to deal with antialiasing "issue" https://github.com/flutter/flutter/issues/17084#issuecomment-385718108
          return Stack(
            children: [
              Container(
                width: 633,
                child: _GameList(
                  games: games,
                ),
              ),
              Positioned(
                right: 0,
                child: Container(
                    width: constraints.maxWidth - 632,
                    child: Builder(builder: (context) {
                      var gameIndex =
                          GamesSampleModel.of(context).selectedIndex;
                      var outGameIndex = GamesSampleModel.of(context).previousSelectedIndex;
                      return Container(
                        height: 771,
                        decoration: BoxDecoration(
                          color: Color(0xff93b7cf),
                        ),
                        child: Stack(
                          children: [
                            if (gameIndex != outGameIndex)
                            _GamePreview(
                              key: Key("fadeout"),
                              game: games[outGameIndex],
                              fadeout: true,
                            ),
                            _GamePreview(
                              game: games[gameIndex],
                              fadein: gameIndex != outGameIndex,
                            ),
                          ],
                        ),
                      );
                    })),
              )
            ],
          );
        }),
      ),
    );
  }
}
