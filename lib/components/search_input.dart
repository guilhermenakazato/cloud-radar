import 'package:cloud_radar/theme/application_colors.dart';
import 'package:cloud_radar/theme/cloud_radar_icons.dart';
import 'package:cloud_radar/theme/input_map_icon_color.dart';
import 'package:cloud_radar/theme/input_search_icon_color.dart';
import 'package:flutter/material.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({super.key, this.enabled = true});
  final bool enabled;

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final FocusNode _focus = FocusNode();
  double _opacity = 0.25;

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
  }

  void _onFocusChange() {
    double newOpacity = _focus.hasFocus ? 1 : 0.25;

    setState(() {
      _opacity = newOpacity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        focusNode: _focus,
        enabled: widget.enabled,
        style: const TextStyle(
          color: ApplicationColors.white,
          fontSize: 16,
          fontFamily: "DM Sans",
          fontWeight: FontWeight.w400,
        ),
        cursorColor: ApplicationColors.white,
        decoration: InputDecoration(
          hintText: "digite aqui",
          hintStyle: TextStyle(
            color: ApplicationColors.white.withValues(alpha: 0.3),
            fontSize: 16,
            fontFamily: "DM Sans",
            fontWeight: FontWeight.w400,
          ),
          prefixIconColor: const InputMapIconColor(),
          suffixIconColor: const InputSearchIconColor(),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(
              left: 4,
              top: 4,
              bottom: 4,
              right: 10,
            ),
            child: Opacity(
              opacity: _opacity,
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
      ),
    );
  }
}
