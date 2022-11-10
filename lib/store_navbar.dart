import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class _NavbarItem extends StatelessWidget {
  final String text;
  final IconData? icon;
  const _NavbarItem({Key? key, required this.text, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            if (icon != null)
              Padding(
                padding: const EdgeInsets.only(right: 2),
                child: Icon(
                  icon!,
                  color: Colors.white.withOpacity(0.5),
                ),
              ),
            Text(text,
                style: GoogleFonts.nunito(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.none,
                    color: Colors.white,
                    shadows: <Shadow>[
                      Shadow(
                          offset: Offset(0, 2),
                          blurRadius: 2,
                          color: Color.fromRGBO(0, 0, 0, 0.3))
                    ])),
          ],
        ),
      ),
    );
  }
}

class StoreNavbar extends StatelessWidget {
  const StoreNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 44),
      child: Container(
        decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.4),
                  offset: Offset(0, 0),
                  blurRadius: 3)
            ],
            gradient: LinearGradient(colors: <Color>[
              Color.fromRGBO(62, 103, 150, 0.918),
              Color.fromRGBO(58, 120, 177, 0.8),
              Color.fromRGBO(15, 33, 110, 0.8),
            ], stops: <double>[
              0.1138,
              0.2523,
              1
            ])),
        width: double.infinity,
        height: 35,
        child: Row(
          children: [
            _NavbarItem(text: "Your Store"),
            _NavbarItem(
              text: "New & Noteworthy",
              icon: Icons.playlist_add,
            ),
            _NavbarItem(
              text: "Categories",
              icon: Icons.playlist_add,
            ),
            _NavbarItem(text: "Points Shop"),
            _NavbarItem(text: "News"),
            _NavbarItem(text: "Labs"),
            Expanded(
              child: Container(),
            ),
            Container(
              height: 30,
              width: 203,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(49, 98, 130, 1),
                  borderRadius: BorderRadius.circular(3),
                  border:
                      Border.all(color: Color.fromRGBO(0, 0, 0, 0.3), width: 1),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Color.fromRGBO(255, 255, 255, 0.2),
                        offset: Offset(1, 1),
                        blurRadius: 0,
                        spreadRadius: 0)
                  ]),
              child: Row(
                children: [
                  Expanded(child: Container()),
                  Container(
                    width: 26,
                    height: 26,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xff8ed4fc),
                            Color(0xff68c2f5),
                          ]),
                      color: Colors.red,
                      borderRadius: BorderRadius.all(
                        Radius.circular(2),
                      ),
                    ),
                    child: Center(
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: Color(0xff68c2f5),
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                        ),
                        child: Icon(
                          Icons.search,
                          color: Color(0xff2a3e5a),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 3,
            )
          ],
        ),
      ),
    );
  }
}
