import 'package:flutter/material.dart';
import 'package:moniepoint_test/src/shared/common_widgets/app_layer_widget.dart';

class MapBuildingInfoIcon extends StatelessWidget {
  const MapBuildingInfoIcon({
    required this.animation,
    required this.count,
    super.key,
  });

  final Animation<double> animation;
  final int count;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, chile) {
        return Transform.scale(
          scaleX:
          animation.value, // Scale only in the x direction
          alignment: Alignment.centerLeft,
          child: AppLayerWidget(
            text: '11.1m P ${(count)}',
          ),
        );
      },
    );
  }
}
