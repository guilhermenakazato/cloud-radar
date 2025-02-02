import 'package:cloud_radar/theme/application_colors.dart';
import 'package:flutter/material.dart';

class ConfigTile<T> extends StatelessWidget {
  const ConfigTile({
    super.key,
    required this.groupValue,
    required this.tileValue,
    required this.onTileTap,
    required this.onRadioTap,
    required this.titleText,
    required this.subtitleText,
  });

  final T? groupValue;
  final T tileValue;
  final void Function()? onTileTap;
  final void Function(T?)? onRadioTap;
  final String titleText, subtitleText;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ApplicationColors.black,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        tileColor: ApplicationColors.black,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
            titleText,
            style: TextStyle(
              color: ApplicationColors.white,
              height: 1,
              fontSize: 16,
            ),
          ),
        ),
        selected: groupValue == tileValue,
        selectedTileColor: ApplicationColors.green500,
        subtitle: Text(
          subtitleText,
          style: TextStyle(
            color: ApplicationColors.white,
            height: 1,
            fontSize: 12,
          ),
        ),
        onTap: onTileTap,
        trailing: Column(
          children: [
            Radio<T>(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              value: tileValue,
              groupValue: groupValue,
              onChanged: onRadioTap,
            ),
          ],
        ),
      ),
    );
  }
}
