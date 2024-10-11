import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:moniepoint_test/src/shared/theme/app_sized.dart';
import 'package:moniepoint_test/src/shared/theme/colors.dart';
import 'package:moniepoint_test/src/shared/theme/typography.dart';

class AppSearchWidget extends StatelessWidget {
  const AppSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          const Gap(20),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(55)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Icon(
                          IconsaxPlusLinear.search_normal_1,
                          color: AppColors.textPrimary,
                          size: MediaQuery.of(context).size.width * 0.06,
                        ),
                        const Gap(12),
                        Expanded(
                          child: TextFormField(
                            initialValue: "Saint Petersburg",
                            style: AppStyles.bodyMedium.copyWith(
                              color: AppColors.textPrimary,
                              fontSize: MediaQuery.of(context).size.width * 0.03,
                            ),
                            cursorColor: AppColors.textPrimary,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              gapSmall,
              Container(
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(100)),
                child: Center(
                  child: Icon(
                    IconsaxPlusLinear.candle_2,
                    color: AppColors.textPrimary,
                    size: MediaQuery.of(context).size.width * 0.06,
                  ),
                ),
              )
            ],
          ),
          const Spacer()
        ],
      ),
    );
  }
}
