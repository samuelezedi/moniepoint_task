import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:moniepoint_test/src/shared/common_widgets/pop_list_item_widget.dart';
import 'package:moniepoint_test/src/shared/modules/animations/scale_animator.dart';
import 'package:moniepoint_test/src/shared/theme/app_sized.dart';
import 'package:moniepoint_test/src/shared/theme/colors.dart';
import 'package:moniepoint_test/src/shared/theme/typography.dart';

class AppMapOptionsWidget extends StatefulWidget {
  const AppMapOptionsWidget({
    required this.onTap,
    required this.currentIndex,
    super.key,
  });

  final int currentIndex;
  final Function(int index) onTap;

  @override
  State<AppMapOptionsWidget> createState() => _AppMapOptionsWidgetState();
}

class _AppMapOptionsWidgetState extends State<AppMapOptionsWidget> {
  bool showPicker = false;
  int index = 1;
  ScaleAnimatorController scaleAnimatorController = ScaleAnimatorController();

  @override
  void initState() {
    setCurrentIndex();
    super.initState();
  }

  void setCurrentIndex() {
    setState(() {
      index = widget.currentIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      child: Column(
        children: [
          const Spacer(),
          Row(
            children: [
              Stack(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        showPicker = true;
                        scaleAnimatorController.start();
                      });
                    },
                    child: SizedBox(
                      height: MediaQuery.of(context).size.width * 0.50,
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          Container(
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(55)),
                            child: Icon(
                              IconsaxPlusLinear.empty_wallet,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ScaleFromBottomLeftAnimator(
                    controller: scaleAnimatorController,
                    child: Container(
                      height: MediaQuery.of(context).size.width * 0.50,
                      width: MediaQuery.of(context).size.width * 0.45,
                      padding: const EdgeInsets.only(
                        left: 17,
                        top: 20,
                        bottom: 20,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: AppColors.white),
                      child: LayoutBuilder(
                        builder: (context, constraint) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PopListItemWidget(

                                icon: Icon(
                                  IconsaxPlusLinear.shield_tick,
                                  color: AppColors.textSecondary,
                                  size: 18,
                                ),
                                constraints: constraint,
                                title: "Cozy areas",
                                index: index,
                                onTap: (i) {
                                  setState(() {
                                    showPicker = false;
                                    index = i;
                                    scaleAnimatorController.reverse();
                                  });

                                  widget.onTap(i);
                                },
                              ),
                              PopListItemWidget(
                                icon: Icon(
                                  IconsaxPlusLinear.empty_wallet,
                                  color: index == 2
                                      ? AppColors.brandPrimary
                                      : AppColors.textSecondary,
                                  size: 18,
                                ),
                                constraints: constraint,
                                title: "Price",
                                index: index,
                                onTap: (i) {
                                  setState(() {
                                    showPicker = false;
                                    index = 2;
                                    scaleAnimatorController.reverse();
                                  });
                                  widget.onTap(2);
                                },
                                textColor: index == 2
                                    ? AppColors.brandPrimary
                                    : AppColors.textSecondary,
                              ),
                              PopListItemWidget(
                                icon: Icon(
                                  IconsaxPlusLinear.bag,
                                  color: AppColors.textSecondary,
                                  size: 18,
                                ),
                                constraints: constraint,
                                index: index,
                                onTap: (i) {
                                  setState(() {
                                    showPicker = false;
                                    index = i;
                                    scaleAnimatorController.reverse();
                                  });
                                  widget.onTap(i);
                                },
                                title: "Infrastructure",
                              ),
                              PopListItemWidget(
                                icon: Icon(
                                  IconsaxPlusLinear.layer,
                                  color: index == 4
                                      ? AppColors.brandPrimary
                                      : AppColors.textSecondary,
                                  size: 18,
                                ),
                                index: index,
                                constraints: constraint,
                                onTap: (i) {
                                  setState(() {
                                    showPicker = false;
                                    index = 4;
                                    scaleAnimatorController.reverse();
                                  });
                                  widget.onTap(4);
                                },
                                title: "Without any layer",
                                textColor: index == 4
                                    ? AppColors.brandPrimary
                                    : AppColors.textSecondary,
                              ),
                            ],
                          );
                        }
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          gapXSmall,
          Row(children: [
            Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(55)),
              child: Center(
                child: RotatedBox(
                  quarterTurns: 1,
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: SvgPicture.asset(
                      'assets/images/svg/linear_send_back.svg',
                      theme: SvgTheme(
                        currentColor: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Container(
              height: 55,
              width: MediaQuery.of(context).size.width * 0.45,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(55)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    IconsaxPlusLinear.textalign_left,
                    color: Colors.white,
                  ),
                  gapSmall,
                  Text(
                    'List of variants',
                    style:
                        AppStyles.bodyMedium.copyWith(color: AppColors.white),
                  )
                ],
              ),
            ),
          ]),
          const Gap(100),
        ],
      ),
    );
  }
}
