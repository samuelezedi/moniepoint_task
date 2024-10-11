import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moniepoint_test/src/shared/theme/colors.dart';
import 'package:moniepoint_test/src/shared/theme/typography.dart';

class GlassButtonWidget extends StatelessWidget {
  const GlassButtonWidget({
    required this.height,
    required this.btnWidth,
    required this.name,
    this.small = false,
    super.key,
  });

  final double height;
  final double btnWidth;
  final String name;
  final bool small;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(height),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 15,
          sigmaY: 15,
        ),
        child: Container(
          height: height,
          width: btnWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(height),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [Colors.white60, Colors.white10],
            ),
          ),
          child: Row(
            children: [
              const Gap(5),
              Expanded(
                  child: Text(
                    name,
                    textAlign: small ? TextAlign.start : TextAlign.center,
                    style: AppStyles.bodyMedium.copyWith(
                      color: AppColors.textPrimary.withOpacity(0.7),
                      fontSize: small ? 11 : 14,
                    ),
                  ),
                ),

              Container(
                height: height - 4,
                width: height - 4,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(height)),
                child: Center(
                  child: Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 10,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              const Gap(2)
            ],
          ),
        ),
      ),
    );
  }
}
