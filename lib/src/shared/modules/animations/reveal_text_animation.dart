import 'package:flutter/material.dart';

class RevealTextAnimation extends StatefulWidget {
  const RevealTextAnimation({
    required this.child,
    required this.delay,
    super.key,
  });

  final Widget child;
  final int delay;

  @override
  State<RevealTextAnimation> createState() => _RevealTextAnimationState();
}

class _RevealTextAnimationState extends State<RevealTextAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

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
    return ClipRect(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Align(
            alignment: Alignment.topCenter,
            heightFactor: _animation.value,
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }
}
