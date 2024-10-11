import 'dart:math';

import 'package:flutter/material.dart';
import 'package:moniepoint_test/src/presentation/home/ui/glass_button_widget.dart';
import 'package:moniepoint_test/src/shared/modules/animations/animation_builder.dart';

class LongImageItemWidget extends StatefulWidget {
  const LongImageItemWidget({super.key});

  @override
  State<LongImageItemWidget> createState() => _LongImageItemWidgetState();
}

class _LongImageItemWidgetState extends State<LongImageItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 370,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(
              image: AssetImage('assets/images/jpg/long-${pickIndex()}.jpg'),
              fit: BoxFit.cover)),
      child: Column(
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GlassButtonWidget(
              height: 30,
              name: "Gladkova St. 43",
              btnWidth: MediaQuery.of(context).size.width,
              small: true,
            ),
          ),
        ],
      ),
    );
  }

  String pickIndex() {
    List<int> numbers = [1, 2, 3, 4, 5];
    Random random = Random();
    int randomIndex = random.nextInt(numbers.length);
    return numbers[randomIndex].toString();
  }
}
