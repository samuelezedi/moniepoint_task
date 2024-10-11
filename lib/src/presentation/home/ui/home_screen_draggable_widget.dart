import 'package:flutter/material.dart';
import 'package:moniepoint_test/src/presentation/home/ui/image_item_widget.dart';
import 'package:moniepoint_test/src/presentation/home/ui/long_image_item.dart';
import 'package:moniepoint_test/src/presentation/home/ui/square_image_item.dart';
import 'package:moniepoint_test/src/shared/theme/app_sized.dart';

class HomeScreenDraggableWidget extends StatelessWidget {
  const HomeScreenDraggableWidget({
    required this.animation,
    required this.begin,
    super.key,
  });

  final Animation<double> animation;
  final double begin;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: animation.value,
      minChildSize: begin,
      maxChildSize: 0.9,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: ListView(
            controller: scrollController,
            children: const [
              gapSmall,
              ImageItemWidget(),
              gapSmall,
              Row(
                children: [
                  Expanded(child: LongImageItemWidget()),
                  gapSmall,
                  Expanded(
                    child: Column(
                      children: [
                        SquareImageItem(),
                        gapSmall,
                        SquareImageItem()
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
