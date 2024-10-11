import 'package:flutter/material.dart';
import 'package:moniepoint_test/src/presentation/home/screens/home_screen.dart';
import 'package:moniepoint_test/src/presentation/home/screens/map_screen.dart';
import 'package:moniepoint_test/src/shared/common_widgets/app_bottom_navigation.dart';
import 'package:moniepoint_test/src/shared/modules/animations/scale_animator.dart';
import 'package:moniepoint_test/src/shared/modules/animations/translate_y_animation.dart';
import 'package:moniepoint_test/src/shared/theme/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 2;
  PageController? pageController;
  ScaleAnimatorController? currentController;
  bool initialLoad = true;

  @override
  void initState() {
    pageController = PageController(initialPage: currentPage,);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bg,
        body: SafeArea(
      child: Stack(
        children: [
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            children: [
              const MapScreen(),
              Container(),
              const HomeScreen(),
              Container(),
              Container()
            ],
          ),
          TranslateYAnimation(
            onCreated: (controller) {
              Future.delayed(const Duration(seconds: 5), () {
                controller.forward();
              });
            },
            child: AppBottomNavigation(
              onClick: (index, controller) {
                setState(() {
                  currentPage = index;
                  pageController?.jumpToPage(index);
                  initialLoad = false;
                });
                currentController?.reverse();
                controller.start();
                currentController = controller;
              },
              setController: (controller) {
                currentController = controller;
                // controller.start();
              },
              index: currentPage,
              initialLoad: initialLoad,
            ),
          )
        ],
      ),
    ));
  }
}
