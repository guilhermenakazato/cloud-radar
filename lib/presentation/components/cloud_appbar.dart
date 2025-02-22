import 'package:cloud_radar/presentation/theme/application_colors.dart';
import 'package:cloud_radar/presentation/theme/cloud_radar_icons.dart';
import 'package:flutter/material.dart';

class CloudAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CloudAppbar({super.key, required this.titleText});
  final String titleText;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(CloudRadarIcons.setaEsquerda),
        onPressed: () {
          Navigator.pop(context);
        },
        style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            ApplicationColors.black800,
          ),
        ),
      ),
      title: Text(
        titleText,
        style: const TextStyle(
          color: ApplicationColors.white,
          fontFamily: "DM Sans",
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: ApplicationColors.black800,
      surfaceTintColor: ApplicationColors.black800,
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
