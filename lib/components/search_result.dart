import 'package:cloud_radar/theme/application_colors.dart';
import 'package:cloud_radar/theme/cloud_radar_icons.dart';
import 'package:flutter/material.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key, required this.titleText, required this.subtitleText});
  final String titleText, subtitleText;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      iconColor: ApplicationColors.white,
      title: Padding(
        padding: const EdgeInsets.only(bottom: 14.0),
        child: Text(titleText),
      ),
      subtitle: Text(subtitleText),
      trailing: const DecoratedBox(
        decoration: BoxDecoration(
        ),
        child: Column(
          children: [
            Icon(
              CloudRadarIcons.local,
            ),
          ],
        ),
      ),
    );
  }
}
