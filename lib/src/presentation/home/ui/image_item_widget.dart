import 'dart:math';

import 'package:flutter/material.dart';
import 'package:moniepoint_test/src/presentation/home/ui/glass_button_widget.dart';

class ImageItemWidget extends StatefulWidget {
  const ImageItemWidget({super.key});

  @override
  State<ImageItemWidget> createState() => _ImageItemWidgetState();
}

class _ImageItemWidgetState extends State<ImageItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:  MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(image: AssetImage('assets/images/jpg/rectangle-${pickIndex()}.jpg'), fit: BoxFit.cover)
      ),
      child: Column(children: [
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(10),
          child: GlassButtonWidget(height: 45, name: "Trevoleva St. 43", btnWidth: MediaQuery.of(context).size.width,),
        )
      ],),
    );
  }

  String pickIndex() {
    List<int> numbers = [1,2];
    Random random = Random();
    int randomIndex = random.nextInt(numbers.length);
    return numbers[randomIndex].toString();
  }
}
