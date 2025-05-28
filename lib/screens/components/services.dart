import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Services extends StatelessWidget {
  String sourceImages;
  double ?width;
  double ?height;
  String title;
  Services({super.key,this.width,this.height, required this.title, required this.sourceImages});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(32),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        spacing: 8,
        children: [
          Image.asset(sourceImages),
          Divider(color: Colors.white),
          Text(title, style: textTheme.bodyMedium),
        ],
      ),
    );
  }
}
