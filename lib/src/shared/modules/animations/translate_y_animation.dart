import 'package:flutter/material.dart';

class TranslateYAnimation extends StatefulWidget {
  const TranslateYAnimation({
    required this.child,
    required this.onCreated,
    super.key,
  });

  final Widget child;
  final Function(AnimationController controller) onCreated;

  @override
  State<TranslateYAnimation> createState() => _TranslateYAnimationState();
}

class _TranslateYAnimationState extends State<TranslateYAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin: const Offset(0, 1),  // Starting beneath
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    widget.onCreated(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return SlideTransition(
          position: _animation,
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
