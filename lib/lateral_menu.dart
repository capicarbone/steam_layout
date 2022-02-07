import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class _SteamGiftCardsBanner extends StatelessWidget {
  const _SteamGiftCardsBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 108,
      color: Colors.white.withOpacity(0.6),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final String text;
  const _MenuItem({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 13, decoration: TextDecoration.none),
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
      padding: const EdgeInsets.only(bottom: 8, top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: TextStyle(
                fontSize: 11,
                decoration: TextDecoration.none,
                color: Colors.white),
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
      height: 1921,
      width: 210,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SteamGiftCardsBanner(),
          _MenuGroup(
              title: "Gift cards",
              items: [_MenuItem(text: "Now Available on Steam")]),
          _MenuGroup(title: "Recommended", items: [
            _MenuItem(text: "By Friends"),
            _MenuItem(text: "By Curators"),
            _MenuItem(text: "Tags"),
          ]),
          _MenuGroup(title: "Discovery queues", items: [
            _MenuItem(text: "Recommendations"),
            _MenuItem(text: "New Releases"),
          ]),
          _MenuGroup(title: "Browse categories", items: [
            _MenuItem(text: "Top Sellers"),
            _MenuItem(text: "New Releases"),
            _MenuItem(text: "Upcoming"),
            _MenuItem(text: "Specials"),
            _MenuItem(text: "VR Titles"),
            _MenuItem(text: "Controller-Friendly"),
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
