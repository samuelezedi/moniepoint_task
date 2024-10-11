import 'package:flutter/material.dart';

class AnimationBuilderWidget extends StatefulWidget {
  const AnimationBuilderWidget({
    required this.delayBeforeStart,
    required this.child,
    required this.alignment,
    super.key,
  });

  final int delayBeforeStart;
  final Widget child;
  final AlignmentGeometry alignment;

  @override
  State<AnimationBuilderWidget> createState() => _AnimationBuilderWidgetState();
}

class _AnimationBuilderWidgetState extends State<AnimationBuilderWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800), // Duration of animation
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    Future.delayed(Duration(seconds: widget.delayBeforeStart), () {
      _controller.forward();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, chile) {
        return Transform.scale(
          scaleX:
          _animation.value, // Scale only in the x direction
          alignment: widget.alignment,
          child: widget.child,
        );
      },
    );
  }
}
