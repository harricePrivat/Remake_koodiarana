import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

// ignore: must_be_immutable
class ButtonKoodiarana extends StatelessWidget {
  GestureTapCallback onTap;
  Widget child;
  double? width;
  Color? color;
  EdgeInsetsGeometry? padding;
  ButtonKoodiarana({
    this.padding,
    super.key,
    this.color,
    required this.onTap,
    this.width,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ShadButton(
      padding: padding,
      backgroundColor: color,
      onPressed: onTap,
      decoration: ShadDecoration(
        border: ShadBorder(radius: BorderRadius.circular(100)),
      ),
      width: width ?? max(0,MediaQuery.of(context).size.width - 80),
      height: 45,
      child: child,
    );
  }
}
