import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moniepoint_test/src/shared/theme/typography.dart';

class PopListItemWidget extends StatelessWidget {
  const PopListItemWidget({
    required this.icon,
    required this.title,
    required this.onTap,
    required this.index,
    required this.constraints,
    this.textColor,
    super.key,
  });

  final Widget icon;
  final String title;
  final Color? textColor;
  final int index;
  final Function(int index) onTap;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(index);
      },
      child: Row(
        children: [
          icon,
          const Gap(11),
          Expanded(
            child: Text(
              title,
              style: AppStyles.bodyMedium.copyWith(fontSize: constraints.maxWidth *0.08, color: textColor,),
            ),
          )
        ],
      ),
    );
  }
}
