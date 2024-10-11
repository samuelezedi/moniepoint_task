import 'package:flutter/material.dart';
import 'package:moniepoint_test/src/shared/theme/app_sized.dart';
import 'package:moniepoint_test/src/shared/theme/colors.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: AppColors.brandPrimary,
        image: const DecorationImage(
          image: AssetImage('assets/images/png/profile.png'),
          fit: BoxFit.cover
        )
      ),
    );
  }
}
