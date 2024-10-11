import 'package:flutter/material.dart';
import 'package:moniepoint_test/src/shared/modules/animations/scale_animator.dart';
import 'package:moniepoint_test/src/shared/theme/colors.dart';

class NavigationIconWidget extends StatefulWidget {
  const NavigationIconWidget({
    required this.icon,
    required this.onTap,
    required this.onCreated,
    this.active = false,
    this.compulsoryLoad = false,
    super.key,
  });


  final Widget icon;
  final bool active;
  final bool compulsoryLoad;
  final Function(ScaleAnimatorController controller) onTap;
  final Function(ScaleAnimatorController controller) onCreated;

  @override
  State<NavigationIconWidget> createState() => _NavigationIconWidgetState();
}

class _NavigationIconWidgetState extends State<NavigationIconWidget> {

  ScaleAnimatorController animatorController = ScaleAnimatorController();

  @override
  void initState() {
    super.initState();
    widget.active;
    widget.onCreated(animatorController);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap(animatorController);
      },
      child:
          Stack(
            children: [
              ScaleAnimator(
                controller: animatorController,
                duration: const Duration(milliseconds: 600),
                child: Container(
                  height:  MediaQuery.of(context).size.width * 0.14,
                  width: MediaQuery.of(context).size.width * 0.14,
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(55),
                    color: AppColors.brandPrimary,
                  ),
                ),
              ),
              Container(
                  height:  MediaQuery.of(context).size.width * 0.14,
                  width: MediaQuery.of(context).size.width * 0.14,
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(55),
                    color: widget.compulsoryLoad ? AppColors.brandPrimary : Colors.transparent,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: widget.active ? Colors.transparent : Colors.black,
                    ),
                    child: Center(
                      child: widget.icon,
                    ),
                  ),
                ),
            ],
          ),
       
    );
  }
}
