import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Services extends StatelessWidget {
  String sourceImages;
  double? width;
  double? height;
  String title;
  Services({
    super.key,
    this.width,
    this.height,
    required this.title,
    required this.sourceImages,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Expanded(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(24),
        ),
        padding: EdgeInsets.all(8),
        child: Column(
          spacing: 4,
          children: [
            Image.asset(sourceImages,width: 60,height: 60,),
            Divider(color: Colors.white),
            Expanded(child: Text(title, style: textTheme.bodySmall)),
          ],
        ),
      ),
    );
  }
}
