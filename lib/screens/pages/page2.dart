import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koodiarana_cl/screens/components/history_card.dart';
import 'package:koodiarana_cl/screens/components/turbo_service.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFD),
      body: SafeArea(
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFDD95FF), Color(0xFF00D4FF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'History',
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.settings, color: Colors.black),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  HistoryCard(
                    name: 'Liam Ford',
                    date: 'Yesterday, 19:40',
                    type: 'Course',
                    icon: "assets/Motorcycle.png",
                    amount: '15000 Ar',
                    time: '50',
                    distance: '3.5',
                    color: Colors.blue,
                  ),
                  const SizedBox(height: 12),
                  HistoryCard(
                    name: 'John Doe',
                    date: 'Monday, 19:40',
                    type: 'Delivery',
                    icon: "assets/Package.png",
                    amount: '10000 Ar',
                    time: '35',
                    distance: '2.5',
                    color: Colors.red,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Turbo services',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TurboService(
                    color: Color(0xFF161CCC),
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      spacing: 12,
                      children: [
                        ShadAvatar('assets/moto.png', size: Size(56, 56)),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Live search ...',
                                style: GoogleFonts.poppins(color: Colors.white),
                              ),
                              Text(
                                '3 found',
                                style: GoogleFonts.poppins(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        FloatingActionButton(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              30,
                            ), // Arrondi personnalisé
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
