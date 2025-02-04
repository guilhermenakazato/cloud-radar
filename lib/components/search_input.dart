import 'package:cloud_radar/theme/application_colors.dart';
import 'package:cloud_radar/theme/cloud_radar_icons.dart';
import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            borderSide: BorderSide(
              color: ApplicationColors.orange,
              width: 10,
            ),
          ),
          hintText: "digite aqui",
          hintStyle: TextStyle(
            color: ApplicationColors.white.withValues(alpha: 0.3),
            fontSize: 16,
            fontFamily: "DM Sans",
            fontWeight: FontWeight.w400,
          ),
          prefixIconColor: ApplicationColors.white,
          suffixIconColor: ApplicationColors.white,
          filled: true,
          fillColor: ApplicationColors.blue400,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(
              left: 4,
              top: 4,
              bottom: 4,
              right: 10,
            ),
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: ApplicationColors.blue,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: Icon(
                CloudRadarIcons.mapa,
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
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: ApplicationColors.blue,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: Icon(
                CloudRadarIcons.procurar,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
