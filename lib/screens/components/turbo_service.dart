import 'package:flutter/material.dart';

class TurboService extends StatelessWidget {
  const TurboService({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16, left: 28, right: 28),
      child: Container(
        padding: EdgeInsets.all(16),
        width: (MediaQuery.of(context).size.width) - 32,
        height: 100,
        decoration: BoxDecoration(
          color: Color(0xFF161CCC),
          borderRadius: BorderRadius.circular(28),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/moto.png"),
            FloatingActionButton(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30), // Arrondi personnalisé
              ),
              onPressed: () {},
              mini: true,
              child: Icon(
                Icons.keyboard_arrow_down_outlined,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
