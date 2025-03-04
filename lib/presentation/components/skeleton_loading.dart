import 'package:cloud_radar/presentation/theme/application_colors.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonLoading extends StatelessWidget {
  const SkeletonLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer.zone(
      enabled: true,
      ignorePointers: true,
      effect: const ShimmerEffect(
        baseColor: ApplicationColors.black300,
        highlightColor: ApplicationColors.black100,
        duration: Duration(seconds: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Bone(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 0.3,
            borderRadius: BorderRadius.circular(12),
            shape: BoxShape.rectangle,
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.sizeOf(context).height * 0.04,
            ),
            child: Column(
              spacing: 8,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 2,
                    children: [
                      Bone(
                        width: MediaQuery.sizeOf(context).width * 0.23,
                        height: MediaQuery.sizeOf(context).height * 0.11,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      Bone(
                        width: MediaQuery.sizeOf(context).width * 0.23,
                        height: MediaQuery.sizeOf(context).height * 0.11,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      Bone(
                        width: MediaQuery.sizeOf(context).width * 0.23,
                        height: MediaQuery.sizeOf(context).height * 0.11,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      Bone(
                        width: MediaQuery.sizeOf(context).width * 0.23,
                        height: MediaQuery.sizeOf(context).height * 0.11,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      Bone(
                        width: MediaQuery.sizeOf(context).width * 0.23,
                        height: MediaQuery.sizeOf(context).height * 0.11,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ],
                  ),
                ),
                Row(
                  spacing: 8,
                  children: [
                    Expanded(
                      child: Bone(
                        height: 55,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    Bone.iconButton(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
