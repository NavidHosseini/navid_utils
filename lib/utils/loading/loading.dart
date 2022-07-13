// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

// ignore: must_be_immutable

/// default loading widget is LoadingAnimationWidget.inkDrop
///
class NHCustomLoading extends StatelessWidget {
  /// default height is context height
  double? height;
  final double radius;
  Color? color;

  /// if loadingWidget ?? color and radios not use
  Widget? loadingWidget;

  NHCustomLoading({
    Key? key,
    this.height,
    required this.radius,
    this.color,
    this.loadingWidget,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? Get.height,
      child: Center(
          child: loadingWidget ??
              LoadingAnimationWidget.inkDrop(
                color: color ?? Theme.of(context).primaryColor,
                size: radius,
              )),
    );
  }
}
