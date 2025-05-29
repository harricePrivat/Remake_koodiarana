import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyPreviousCoursesWidget extends StatelessWidget {
  String title;
  Color ?backgroundColor;
  MyPreviousCoursesWidget({super.key, required this.title,this.backgroundColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(20),
      height: 235,
      decoration: BoxDecoration(
        color:backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header avec titre et bouton dropdown
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.black54,
                  size: 18,
                ),
              ),
            ],
          ),

          SizedBox(height: 20),

          // Effet d'empilement avec Transform
          Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: 64,
                  left: 8,
                  right: 0,
                  child: CourseCard(
                    title: "Course",
                    time: "Sunday, 13:15 - 15:00",
                    price: "",
                    color: Color(0xFFD32F2F),
                  ),
                ),
                Positioned(
                  top: 32,
                  left: 4,
                  right: 0,
                  child: CourseCard(
                    title: "Course",
                    time: "Today, 12:15 - 16:45",
                    price: "",
                    color: Color(0xFFFF5722),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: CourseCard(
                    title: "Course",
                    time: "Yesterday, 16:20 - 16:45",
                    price: "12 000 Ar",
                    color: Color(0xFF2196F3),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String title;
  final String time;
  final String price;
  final Color color;

  const CourseCard({
    super.key,
    required this.title,
    required this.time,
    required this.price,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Icone
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.two_wheeler, color: Colors.white, size: 24),
          ),
          SizedBox(width: 16),

          // Texte
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title.isNotEmpty)
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                SizedBox(height: 4),
                Text(
                  time,
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
          ),

          if (price.isNotEmpty)
            Text(
              price,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
        ],
      ),
    );
  }
}
