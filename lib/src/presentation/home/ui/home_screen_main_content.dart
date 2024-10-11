import 'package:flutter/material.dart';
import 'package:moniepoint_test/src/presentation/home/ui/avatar_widget.dart';
import 'package:moniepoint_test/src/presentation/home/ui/large_container_widget.dart';
import 'package:moniepoint_test/src/presentation/home/ui/location_descriptor_widget.dart';
import 'package:moniepoint_test/src/shared/modules/animations/animation_builder.dart';
import 'package:moniepoint_test/src/shared/modules/animations/reveal_text_animation.dart';
import 'package:moniepoint_test/src/shared/modules/animations/scale_animator.dart';
import 'package:moniepoint_test/src/shared/theme/app_sized.dart';
import 'package:moniepoint_test/src/shared/theme/colors.dart';
import 'package:moniepoint_test/src/shared/theme/typography.dart';

class HomeScreenMainContent extends StatelessWidget {
  const HomeScreenMainContent({
    required this.profilePictureAnimation,
    required this.profilePictureAnimation2,
    required this.profilePictureAnimation3,
    super.key,
  });

  final ScaleAnimatorController profilePictureAnimation;
  final ScaleAnimatorController profilePictureAnimation2;
  final ScaleAnimatorController profilePictureAnimation3;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        gapSmall,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const AnimationBuilderWidget(
              delayBeforeStart: 0,
              alignment: Alignment.centerLeft,
              child: LocationDescriptorWidget(),
            ),
            ScaleAnimator(
              controller: profilePictureAnimation,
              duration: const Duration(milliseconds: 1000),
              child: const AvatarWidget(),
            )
          ],
        ),
        gapXLarge,
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: RevealTextAnimation(
                delay: 1,
                child: Row(
                  children: [
                    Text(
                      "Hi, Marina",
                      style: AppStyles.headline1.copyWith(
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: RevealTextAnimation(
                delay: 1,
                child: Row(
                  children: [
                    Text(
                      "Let's select your\nperfect place",
                      style: AppStyles.headline1.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 32,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        gapXLarge,
        Row(
          children: [
            Expanded(
              child: ScaleAnimator(
                controller: profilePictureAnimation2,
                duration: const Duration(milliseconds: 800),
                child: LayoutBuilder(
                  builder: (context, constraint) {
                    return LargeContainerWidget(
                      color: AppColors.brandPrimary,
                      size: constraint.maxWidth,
                      radius: constraint.maxWidth,
                      title: 'BUY',
                      textColor: AppColors.white,
                      beginText: 100,
                      endText: 1034,
                      subText: 'offers',
                    );
                  }
                ),
              ),
            ),
            gapSmall,
            Expanded(
              child: ScaleAnimator(
                controller: profilePictureAnimation3,
                duration: const Duration(
                  milliseconds: 800,
                ),
                child: LayoutBuilder(
                  builder: (context, constraint) {
                    return LargeContainerWidget(
                      color: AppColors.white,
                      size: constraint.maxWidth,
                      radius: 30,
                      title: 'RENT',
                      textColor: AppColors.textSecondary,
                      beginText: 500,
                      endText: 2212,
                      subText: 'offers',
                    );
                  }
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
