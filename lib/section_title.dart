import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:steam_flutter_layout/app_colors.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String? subtitle;
  final List<String> links;
  const SectionTitle({Key? key, required this.title, this.subtitle, this.links = const []})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    var titleWidget = subtitle == null ? Text(
      title.toUpperCase(),
      style: Theme.of(context).textTheme.titleMedium,
    ): Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          subtitle!.toUpperCase(),
          style: Theme.of(context).textTheme.titleMedium,
        )
      ],
    );
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            titleWidget,
            Row(
              children: [
                ...links.map((e) => Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: AppColors.darkColor),
                        borderRadius: BorderRadius.circular(1),
                      ),
                      child: Text(
                        e.toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(fontSize: 12, color: Colors.white),
                      ),
                    ))
              ],
            )
          ],
        ),
        SizedBox(
          height: 14,
        ),
      ],
    );
  }
}
