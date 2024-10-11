import 'package:flutter/material.dart';
import 'package:moniepoint_test/src/shared/modules/animations/scale_animator.dart';
import 'package:moniepoint_test/src/shared/theme/colors.dart';
import 'package:moniepoint_test/src/shared/theme/typography.dart';

class AppLayerWidget extends StatefulWidget {
  const AppLayerWidget({
    required this.text,
    super.key,
  });
  final String text;

  @override
  State<AppLayerWidget> createState() => _AppLayerWidgetState();
}

class _AppLayerWidgetState extends State<AppLayerWidget> {
  bool visible = false;

  ScaleAnimatorController controller = ScaleAnimatorController();

  @override
  void initState() {
    // TODO: implement initState
    // controller.start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 80,
      decoration: BoxDecoration(
        color: AppColors.brandPrimary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Center(
        child: Text(
          widget.text,
          style: AppStyles.bodyMedium.copyWith(
            color: AppColors.white,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
