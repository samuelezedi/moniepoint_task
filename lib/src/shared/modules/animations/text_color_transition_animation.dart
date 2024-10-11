import 'package:flutter/material.dart';
import 'package:moniepoint_test/src/shared/theme/colors.dart';

class ColorTransitionText extends StatefulWidget {
  const ColorTransitionText({
    required this.child,
    required this.delay,
    super.key,
  });

  final Widget child;
  final int delay;

  @override
  State<ColorTransitionText> createState() => _ColorTransitionTextState();
}

class _ColorTransitionTextState extends State<ColorTransitionText>
    with SingleTickerProviderStateMixin {
  Color _textColor = Colors.transparent;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..addListener(() {
        setState(() {
          _textColor =
              Color.lerp(Colors.transparent, AppColors.textSecondary, _controller.value)!;
        });
      });

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
    return AnimatedDefaultTextStyle(
      duration: const Duration(
        milliseconds: 0,
      ),
      style: TextStyle(
        fontSize: 12,
        color: _textColor,
      ),
      child: widget.child,
    );
  }
}
