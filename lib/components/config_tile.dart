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
    return ListTile(
      titleAlignment: ListTileTitleAlignment.top,
      title: Padding(
        padding: const EdgeInsets.only(
          bottom: 14.0,
        ),
        child: Text(
          titleText,
        ),
      ),
      selected: groupValue == tileValue,
      subtitle: Text(
        subtitleText,
      ),
      onTap: onTileTap,
      trailing: Radio<T>(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        value: tileValue,
        groupValue: groupValue,
        onChanged: onRadioTap,
      ),
    );
  }
}
