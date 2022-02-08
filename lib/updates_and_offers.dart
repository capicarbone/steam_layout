import 'package:flutter/widgets.dart';

class _OfferPanel extends StatelessWidget {
  const _OfferPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff2e4a60),
    );
  }
}

class UpdatesAndOffers extends StatelessWidget {
  const UpdatesAndOffers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 422,
      child: Row(
        children: [
          Container(
            width: 378,
            child: _OfferPanel(),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(3, (index) => Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      height: 206,
                      child: _OfferPanel(),
                    ),
                  )),
                ),Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(3, (index) => Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      height: 206,
                      child: _OfferPanel(),
                    ),
                  )),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
