import 'package:flutter/material.dart';
import 'package:moniepoint_test/src/shared/theme/colors.dart';

class HomeScreenGradientBackground extends StatelessWidget {
  const HomeScreenGradientBackground({
    required this.child,
    super.key,});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return Container(
        height: constraint.maxHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.textSecondary.withOpacity(0.1),
              AppColors.brandPrimary.withOpacity(0.3),
              AppColors.textSecondary.withOpacity(0.1),
              AppColors.textSecondary.withOpacity(0.1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0.2, 0.6, 0.9, 1.0],
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: child,
      );
    });
  }
}
