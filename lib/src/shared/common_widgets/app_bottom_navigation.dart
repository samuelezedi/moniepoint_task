import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:moniepoint_test/src/shared/common_widgets/navigation_icon_widget.dart';
import 'package:moniepoint_test/src/shared/modules/animations/scale_animator.dart';
import 'package:moniepoint_test/src/shared/theme/colors.dart';

class AppBottomNavigation extends StatefulWidget {
  const AppBottomNavigation({
    required this.onClick,
    required this.index,
    this.setController,
    this.initialLoad = false,
    super.key,
  });

  final Function(int index, ScaleAnimatorController controller) onClick;
  final Function(ScaleAnimatorController controller)? setController;
  final int index;
  final bool initialLoad;

  @override
  State<AppBottomNavigation> createState() => _AppBottomNavigationState();
}

class _AppBottomNavigationState extends State<AppBottomNavigation> {

  ScaleAnimatorController? currentController;

  @override
  void initState() {

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 65,
              decoration: BoxDecoration(
                  color: AppColors.textPrimary,
                  borderRadius: BorderRadius.circular(60)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NavigationIconWidget(
                    icon: Icon(IconsaxPlusBold.search_normal_1, size: 24, color: AppColors.white,),
                    active: widget.index == 0,
                    onTap: (controller) {
                      widget.onClick(0, controller);
                    },
                    onCreated: (controller) {

                    },
                  ),
                  NavigationIconWidget(
                    icon: Icon(IconsaxPlusBold.message, size: 24, color: AppColors.white,),
                    active: widget.index == 1,
                    onTap: (controller) {
                      widget.onClick(1, controller);
                    },
                    onCreated: (controller) {

                    },
                  ),
                  NavigationIconWidget(
                    icon: Icon(IconsaxPlusBold.home, size: 24, color: AppColors.white,),
                    active: widget.index == 2,
                    compulsoryLoad: widget.initialLoad,
                    onTap: (controller) {
                      widget.onClick(2, controller);
                    },
                    onCreated: (controller) {
                      widget.setController!(controller);
                    },
                  ),
                  NavigationIconWidget(
                    icon: Icon(IconsaxPlusBold.heart, size: 24, color: AppColors.white,),
                    active: widget.index == 3,
                    onTap: (controller) {
                      widget.onClick(3, controller);
                    },
                    onCreated: (controller) {

                    },
                  ),
                  NavigationIconWidget(
                    icon: SizedBox(
                      width: 24,
                      height: 24,
                      child: SvgPicture.asset(
                        'assets/images/svg/user.svg',
                          theme: SvgTheme(
                            currentColor: AppColors.white,
                          ),
                      ),
                    ),
                    active: widget.index == 4,
                    onTap: (controller) {
                      widget.onClick(4, controller);
                    },
                    onCreated: (controller) {

                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        const Gap(15)
      ],
    );
  }
}
