import 'package:cloud_radar/theme/application_colors.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.titleText,
    required this.subtitleText,
    required this.trailing,
    this.selected = false,
    this.enabled = true,
    this.onTap,
  });

  final bool selected, enabled;
  final Widget trailing;
  final String titleText, subtitleText;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final Color hoveredColor = ApplicationColors.blue500,
        focusedColor = ApplicationColors.blue600,
        selectedColor = ApplicationColors.blue900,
        disabledColor = ApplicationColors.black600,
        defaultColor = ApplicationColors.black800;

    final Set<WidgetState> states = <WidgetState>{
      if (!enabled) WidgetState.disabled,
      if (selected) WidgetState.selected,
    };

    Color resolveColor(
      Color selectedColor,
      Color enabledColor,
      Color disabledColor,
    ) {
      return _IndividualOverrides(
        selectedColor: selectedColor,
        enabledColor: enabledColor,
        disabledColor: disabledColor,
      ).resolve(states);
    }

    Color listItemColor =
        resolveColor(selectedColor, defaultColor, disabledColor);

    return InkWell(
      focusColor: focusedColor,
      hoverColor: hoveredColor,
      highlightColor: selectedColor,
      splashColor: ApplicationColors.blue800,
      borderRadius: BorderRadius.circular(12),
      onTap: enabled ? onTap : null,
      child: Ink(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: listItemColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              spacing: 14,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titleText,
                  style: const TextStyle(
                    color: ApplicationColors.white,
                    height: 1,
                    fontSize: 16,
                    fontFamily: "DM Sans",
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  subtitleText,
                  style: const TextStyle(
                    color: ApplicationColors.white,
                    height: 1,
                    fontSize: 12,
                    fontFamily: "DM Sans",
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            trailing
          ],
        ),
      ),
    );
  }
}

class _IndividualOverrides extends WidgetStateProperty<Color> {
  _IndividualOverrides({
    required this.enabledColor,
    required this.selectedColor,
    required this.disabledColor,
  });

  final Color enabledColor;
  final Color selectedColor;
  final Color disabledColor;

  @override
  Color resolve(Set<WidgetState> states) {
    if (states.contains(WidgetState.disabled)) {
      return disabledColor;
    }
    if (states.contains(WidgetState.selected)) {
      return selectedColor;
    }
    return enabledColor;
  }
}
