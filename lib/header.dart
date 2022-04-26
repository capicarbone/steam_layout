import 'package:flutter/material.dart';
import 'package:steam_flutter_layout/app_colors.dart';

class HeaderItem extends StatelessWidget {
  final String text;
  const HeaderItem({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text.toUpperCase(),
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      padding: EdgeInsets.only(right: 14),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 44),
      height: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            children: [
              HeaderItem(text: "Steam"), // TODO to logo
              HeaderItem(text: "Store"),
              HeaderItem(text: "Community"),
              HeaderItem(text: "About"),
              HeaderItem(text: "Support")
            ],
          ),
          Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.only(top: 6),
                // height: 23,
                // width: 234,
                child: Row(
                  children: [
                    Container(
                      height: 24,
                      width: 110,
                      color: AppColors.green,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 11),
                            child: Icon(
                              Icons.archive_sharp,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                          Text(
                            "Install Steam",
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 11),
                      child: Text(
                        "login".toLowerCase(),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    Text(
                      "|",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 11),
                      child: Row(
                        children: [
                          Text(
                            "language".toLowerCase(),
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Icon(Icons.arrow_drop_down_outlined, color: AppColors.darkText,)
                        ],
                      ),
                    )
                  ],

                ),
              ))
        ],
      ),
    );
  }
}
