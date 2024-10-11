import 'package:flutter/material.dart';


class ScaleAnimatorController {
  late AnimationController _animationController;

  void _attach(AnimationController animationController) {
    _animationController = animationController;
  }

  void start() {
    _animationController.forward();
  }

  void reverse() {
    _animationController.reverse();
  }

  void dispose() {
    _animationController.dispose();
  }
}

class ScaleAnimator extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Curve curve;
  final ScaleAnimatorController controller;


  const ScaleAnimator({
    required this.child,
    required this.controller,
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.easeInOut,
    super.key,
  });

  @override
  ScaleAnimatorState createState() => ScaleAnimatorState();
}

class ScaleAnimatorState extends State<ScaleAnimator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    );

    widget.controller._attach(_controller);
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: widget.child,
    );
  }
}


class ScaleFromBottomLeftAnimator extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Curve curve;
  final ScaleAnimatorController controller;
  final AlignmentGeometry alignment;

  const ScaleFromBottomLeftAnimator({
    required this.child,
    required this.controller,
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.easeInOut,
    this.alignment = Alignment.bottomLeft,
    super.key,
  });

  @override
  State<ScaleFromBottomLeftAnimator> createState() => _ScaleAnimatorState();
}

class _ScaleAnimatorState extends State<ScaleFromBottomLeftAnimator> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    );

    widget.controller._attach(_controller); // Attach external controller
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget? child) {
        return Align(
          alignment: widget.alignment,
          child: Transform.scale(
            alignment: widget.alignment,
            scale: _animation.value,
            child: widget.child,
          ),
        );
      },
    );
  }
}

