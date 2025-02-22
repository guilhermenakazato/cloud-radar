import 'package:cloud_radar/presentation/theme/application_colors.dart';
import 'package:cloud_radar/presentation/theme/cloud_radar_icons.dart';
import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({
    super.key,
    this.enabled = true,
    this.onTap,
    required this.iconOpacity,
    this.inputFocus,
    this.controller,
    this.onFieldSubmitted,
  });

  final bool enabled;
  final Function()? onTap;
  final Function(String)? onFieldSubmitted;
  final double iconOpacity;
  final FocusNode? inputFocus;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onFieldSubmitted,
      controller: controller,
      focusNode: inputFocus,
      onTap: onTap,
      enabled: enabled,
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
          child: Opacity(
            opacity: iconOpacity,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: ApplicationColors.blue900,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                CloudRadarIcons.mapa,
              ),
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
              CloudRadarIcons.procurar,
            ),
          ),
        ),
      ),
    );
  }
}
