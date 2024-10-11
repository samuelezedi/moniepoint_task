import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:moniepoint_test/src/shared/extensions/string_hardcoded.dart';
import 'package:moniepoint_test/src/shared/modules/animations/icon_color_transition_animation.dart';
import 'package:moniepoint_test/src/shared/modules/animations/text_color_transition_animation.dart';
import 'package:moniepoint_test/src/shared/theme/app_sized.dart';
import 'package:moniepoint_test/src/shared/theme/colors.dart';

class LocationDescriptorWidget extends StatelessWidget {
  const LocationDescriptorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.white,
      ),
      child: Row(
        children: [
          const IconColorTransitionAnimation(
            icon: IconsaxPlusBold.location,
            delay: 1,
          ),
          gapSmall,
          ColorTransitionText(
            delay: 1,
            child: Text(
              'Saint Petersburg'.hardcoded,
            ),
          )
        ],
      ),
    );
  }
}
