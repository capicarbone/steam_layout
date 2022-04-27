import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:steam_flutter_layout/app_colors.dart';

class _SteamGiftCardsBanner extends StatelessWidget {
  const _SteamGiftCardsBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      width: double.infinity,
      height: 108,
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1, color: Color(0xff2f6182)))),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final String text;
  final IconData? icon;
  const _MenuItem({Key? key, required this.text, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7),
      child: Row(
        children: [
          if (icon != null)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                    color: AppColors.darkerBackground,
                    borderRadius: BorderRadius.circular(3)),
                child: Center(
                    child: Icon(
                  icon,
                  color: AppColors.highlightedText,
                  size: 13,
                )),
              ),
            ),
          Text(
            text,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                fontSize: 13,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w400,
                color: AppColors.highlightedText),
          ),
        ],
      ),
    );
  }
}

class _MenuGroup extends StatelessWidget {
  final String title;
  final List<_MenuItem> items;
  const _MenuGroup({Key? key, required this.title, required this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 11),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              title.toUpperCase(),
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: 11,
                  decoration: TextDecoration.none,
                  color: AppColors.darkText),
            ),
          ),
          ...items
        ],
      ),
    );
  }
}

class LateralMenu extends StatelessWidget {
  const LateralMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SteamGiftCardsBanner(),
          _MenuGroup(
              title: "Gift cards",
              items: [_MenuItem(text: "Now Available on Steam")]),
          _MenuGroup(title: "Recommended", items: [
            _MenuItem(
              text: "By Friends",
              icon: Icons.group,
            ),
            _MenuItem(
              text: "By Curators",
              icon: Icons.wifi,
            ),
            _MenuItem(
              text: "Tags",
              icon: Icons.label,
            ),
          ]),
          _MenuGroup(title: "Discovery queues", items: [
            _MenuItem(
              text: "Recommendations",
              icon: Icons.library_books_rounded,
            ),
            _MenuItem(
              text: "New Releases",
              icon: Icons.library_books_rounded,
            ),
          ]),
          _MenuGroup(title: "Browse categories", items: [
            _MenuItem(
              text: "Top Sellers",
              icon: Icons.trending_up,
            ),
            _MenuItem(text: "New Releases", icon: Icons.add),
            _MenuItem(text: "Upcoming", icon: Icons.watch_later_outlined),
            _MenuItem(
              text: "Specials",
              icon: Icons.percent,
            ),
            _MenuItem(
              text: "VR Titles",
              icon: Icons.vrpano_outlined,
            ),
            _MenuItem(
                text: "Controller-Friendly", icon: Icons.gamepad_outlined),
          ]),
          _MenuGroup(title: "Browse By Genre", items: [
            _MenuItem(text: "Free to Play"),
            _MenuItem(text: "Early Access"),
            _MenuItem(text: "Action"),
            _MenuItem(text: "Adventure"),
            _MenuItem(text: "Casual"),
            _MenuItem(text: "Indie"),
            _MenuItem(text: "Massively Multiplayer"),
            _MenuItem(text: "Racing"),
            _MenuItem(text: "RPG"),
            _MenuItem(text: "Simulation"),
            _MenuItem(text: "Sports"),
            _MenuItem(text: "Strategy"),
          ]),
        ],
      ),
    );
  }
}
