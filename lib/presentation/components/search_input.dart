import 'package:cloud_radar/presentation/theme/application_colors.dart';
import 'package:cloud_radar/presentation/theme/cloud_radar_icons.dart';
import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({
    super.key,
    this.autofocus = false,
    this.enabled = true,
    this.onTap,
    this.canRequestFocus = true,
    this.inputFocus,
    this.controller,
    this.onFieldSubmitted,
    this.readonly = false,
  });

  final bool readonly;
  final bool enabled;
  final bool canRequestFocus;
  final bool autofocus;
  final Function()? onTap;
  final Function(String)? onFieldSubmitted;
  final FocusNode? inputFocus;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: onFieldSubmitted,
      controller: controller,
      focusNode: inputFocus,
      onTap: onTap,
      enabled: enabled,
      autofocus: autofocus,
      readOnly: readonly,
      canRequestFocus: canRequestFocus,
      style: const TextStyle(
        color: ApplicationColors.white,
        fontSize: 16,
        fontFamily: "DM Sans",
        fontWeight: FontWeight.w400,
      ),
      cursorColor: ApplicationColors.white,
      decoration: InputDecoration(
        hintText: "digite aqui",
        prefixIcon: Padding(
          padding: const EdgeInsets.only(
            left: 4,
            top: 4,
            bottom: 4,
            right: 10,
          ),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: ApplicationColors.blue900.withValues(alpha: 0.25),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              CloudRadarIcons.map,
            ),
          ),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
            top: 4,
            bottom: 4,
            right: 4,
          ),
          child: Container(
            padding: const EdgeInsets.all(12),
            child: const Icon(
              CloudRadarIcons.search,
            ),
          ),
        ),
      ),
    );
  }
}
