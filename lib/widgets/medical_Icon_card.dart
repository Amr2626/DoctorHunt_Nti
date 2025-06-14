import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MedicalIconCard extends StatelessWidget {
  final String assetPath;
  final Color backgroundColor;
  final double iconSize;

  const MedicalIconCard({
    required this.assetPath,
    required this.backgroundColor,
    this.iconSize = 56,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 119,
      height: 113,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: SvgPicture.asset(
          assetPath,
          width: iconSize,
          height: iconSize,
          color: Colors.white,
        ),
      ),
    );
  }
}
