import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FloatingActionButtonKoodiarana extends StatelessWidget {
  FloatingActionButtonKoodiarana({
    required this.onPressed,
    required this.isScroolable,
    super.key,
  });
  GestureTapCallback onPressed;
  bool isScroolable;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      onPressed: onPressed,
      backgroundColor: Colors.white,
      child:
          isScroolable
              ? Icon(Icons.map, color: Colors.red, size: 30)
              : Icon(Icons.map, color: Colors.green),
    );
  }
}
