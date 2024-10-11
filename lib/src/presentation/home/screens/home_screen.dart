import 'package:flutter/material.dart';
import 'package:moniepoint_test/src/presentation/home/ui/home_screen_draggable_widget.dart';
import 'package:moniepoint_test/src/presentation/home/ui/home_screen_gradient_background.dart';
import 'package:moniepoint_test/src/presentation/home/ui/home_screen_main_content.dart';
import 'package:moniepoint_test/src/shared/modules/animations/scale_animator.dart';
import 'package:moniepoint_test/src/shared/theme/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  double begin = 0.04;
  ScaleAnimatorController profilePictureAnimation = ScaleAnimatorController();
  ScaleAnimatorController profilePictureAnimation2 = ScaleAnimatorController();
  ScaleAnimatorController profilePictureAnimation3 = ScaleAnimatorController();

  @override
  void initState() {
    super.initState();
    _handleAnimationEffects();
  }

  void _animateSheet() async {
    await Future.delayed(const Duration(seconds: 2));
    await _animationController.forward();

    // await Future.delayed(const Duration(seconds: 2));
    // double targetValue = 0.15;
    // double targetFraction = (_animation.value - targetValue);
    // await _animationController.animateTo(0.48,
    //     duration: const Duration(seconds: 1));
  }

  void _handleAnimationEffects() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    final curveAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _animation = Tween<double>(begin: begin, end: 0.5).animate(curveAnimation)
      ..addListener(() {
        setState(() {});
      });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      profilePictureAnimation.start();
      Future.delayed(const Duration(seconds: 2), () {
        profilePictureAnimation2.start();
        profilePictureAnimation3.start();
      });

      Future.delayed(const Duration(seconds: 1), () {
        _animateSheet();
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.textSecondary.withOpacity(0.1),
            AppColors.brandPrimary.withOpacity(0.4),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: const [0.6, 1.0],
        ),
      ),
      child: Stack(
        children: [
          HomeScreenGradientBackground(
            child: HomeScreenMainContent(
              profilePictureAnimation2: profilePictureAnimation2,
              profilePictureAnimation3: profilePictureAnimation3,
              profilePictureAnimation: profilePictureAnimation,
            ),
          ),
          HomeScreenDraggableWidget(animation: _animation, begin: begin),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
