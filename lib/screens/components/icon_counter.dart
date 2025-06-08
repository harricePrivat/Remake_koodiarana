import 'package:flutter/material.dart';

// ignore: must_be_immutable
class IconCounter extends StatelessWidget {
  String icon;
  String count;
  IconCounter({super.key, required this.count, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        // color: Colors.grey.shade100,
        // border: BoxBorder.all(color: Colors.grey, width: 0.1),
        border: Border(
          top: BorderSide(color: Colors.grey, width: 0.5),
          bottom: BorderSide(color: Colors.grey, width: 0.5),
          left: BorderSide(color: Colors.grey, width: 0.5),
          right: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      // child: Center(
      child: Row(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(icon),
          const SizedBox(height: 4),
          Text(count, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
      // ),
    );
  }
}
