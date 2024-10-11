import 'dart:math';

import 'package:flutter/material.dart';
import 'package:moniepoint_test/src/presentation/home/ui/glass_button_widget.dart';

class SquareImageItem extends StatefulWidget {
  const SquareImageItem({super.key});

  @override
  State<SquareImageItem> createState() => _SquareImageItemState();
}

class _SquareImageItemState extends State<SquareImageItem> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(image: AssetImage('assets/images/jpg/square-${pickIndex()}.jpg'), fit: BoxFit.cover)
      ),
      child: Column(children: [
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: GlassButtonWidget(height: 30, name: "Gladkova St. 43", btnWidth: MediaQuery.of(context).size.width, small: true,),
        )
      ],),
    );
  }

  String pickIndex() {
    List<int> numbers = [1,2,3];
    Random random = Random();
    int randomIndex = random.nextInt(numbers.length);
    return numbers[randomIndex].toString();
  }
}
