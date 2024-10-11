import 'package:flutter/material.dart';
import 'package:moniepoint_test/src/shared/theme/app_sized.dart';
import 'package:moniepoint_test/src/shared/theme/colors.dart';

class IconColorTransitionAnimation extends StatefulWidget {
  const IconColorTransitionAnimation({
    required this.icon,
    required this.delay,
    super.key,
  });

  final IconData icon;
  final int delay;

  @override
  State<IconColorTransitionAnimation> createState() =>
      _IconColorTransitionAnimationState();
}

class _IconColorTransitionAnimationState
    extends State<IconColorTransitionAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _colorAnimation = ColorTween(
      begin: Colors.transparent,
      end: AppColors.textSecondary,
    ).animate(_controller);

    Future.delayed(Duration(seconds: widget.delay), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _colorAnimation,
      builder: (context, child) {
        return Icon(
          widget.icon,
          color: _colorAnimation.value,
          size: AppSizes.m,
        );
      },
    );
  }
}
