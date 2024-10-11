import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moniepoint_test/src/shared/theme/colors.dart';

class MapScreenBuildingIcon extends StatelessWidget {
  const MapScreenBuildingIcon({
    required this.showIcon,
    super.key,
  });

  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: showIcon,
      child: Container(
        height: 45,
        width: 40,
        decoration: BoxDecoration(
          color: AppColors.brandPrimary,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: Center(
            child: SizedBox(
              height: 24,
              width: 24,
              child: SvgPicture.asset(
                'assets/images/svg/bold_building.svg',
              ),
            )),
      ),
    );
  }
}
