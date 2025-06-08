import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TurboService extends StatelessWidget {
  Widget child;
  Color? color;
  Gradient? gradient;
  EdgeInsetsGeometry? padding;
  TurboService({
    super.key,
    this.padding,
    this.gradient,
    this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.only(top: 16, left: 28, right: 28),
      child: Container(
        padding: EdgeInsets.all(16),
        width: (MediaQuery.of(context).size.width) - 32,
        height: 100,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(28),
          gradient: gradient,
        ),
        child: child,
      ),
    );
  }
}
