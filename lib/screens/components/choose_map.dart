import 'package:flutter/material.dart';

class ChooseMap extends StatefulWidget {
  const ChooseMap({super.key});

  @override
  State<ChooseMap> createState() => _ChooseMapState();
}

class _ChooseMapState extends State<ChooseMap> {
  @override
  Widget build(BuildContext context) {
    final size = (MediaQuery.of(context).size.width / 4);

    return SizedBox(
      width: size,
      height: size,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: Colors.black),
            BoxShadow(color: Colors.black),
          ],
        ),
        child: Center(
          child: Column(
            spacing: 16,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Icon(Icons.map), Text("Choose")],
          ),
        ),
      ),
    );
  }
}
