import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:moniepoint_test/src/shared/theme/typography.dart';

class LargeContainerWidget extends StatelessWidget {
  const LargeContainerWidget({
    required this.color,
    required this.size,
    required this.title,
    required this.textColor,
    required this.beginText,
    required this.endText,
    required this.subText,
    this.radius = 0,
    super.key,
  });

  final Color color;
  final double size;
  final double radius;
  final String title;
  final Color textColor;
  final double beginText;
  final double endText;
  final String subText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: AppStyles.headline2.copyWith(
                  color: textColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w300
                ),
              )
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Countup(
                begin: beginText,
                end: endText,
                duration: const Duration(seconds: 3),
                separator: ' ',
                style: AppStyles.headline2.copyWith(color: textColor, fontSize: 40, fontWeight: FontWeight.w600,),
              ),
              // TextCounterAnimation(duration: const Duration(milliseconds: 500), value: 1000,style: AppStyles.headline2.copyWith(color: textColor, fontSize: 40, fontWeight: FontWeight.w600,),)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                subText,
                style: AppStyles.bodyMedium.copyWith(
                  color: textColor,
                ),
              )
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
