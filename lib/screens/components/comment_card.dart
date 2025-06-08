import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CommentCard extends StatelessWidget {
  String name;
  String comment;
  String date;
  int rating;
  Color color;
  CommentCard({
    super.key,
    required this.name,
    required this.comment,
    required this.date,
    required this.rating,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(radius: 12),
              const SizedBox(width: 10),
              Text(
                name,
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(comment),
          const SizedBox(height: 8),
          Text(
            date,
            style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Text(
                  'You gave',
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
                const SizedBox(width: 10),
                ...List.generate(
                  rating,
                  (index) =>
                      const Icon(Icons.star, size: 16, color: Colors.yellow),
                ),
                const SizedBox(width: 6),
                Text(
                  '$rating',
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
