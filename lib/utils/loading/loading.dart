import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomLoading extends StatelessWidget {
  final double height;
  final double radius;
  final color;

  const CustomLoading({
    Key? key,
    required this.height,
    required this.radius,
    this.color,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height != 0.0 ? height : Get.height,
      child: Center(
          child: LoadingAnimationWidget.inkDrop(
        color: color ?? Theme.of(context).primaryColor,
        size: radius,
      )),
    );
  }
}
