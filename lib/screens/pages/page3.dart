import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koodiarana_cl/screens/components/comment_card.dart';
import 'package:koodiarana_cl/screens/components/turbo_service.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFD),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: Column(
            // spacing: 20,
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gradient background with Profile Picture & Name
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(vertical: 30),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFDD95FF), Color(0xFF00D4FF)],
                    // begin: Alignment.topLeft,
                    // end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                  spacing: 16,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        const CircleAvatar(
                          radius: 45,
                          backgroundImage: AssetImage('assets/user.png'),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: 14,
                            backgroundColor: Colors.green,
                            child: const Icon(
                              Icons.add,
                              size: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'John Doe',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Text('Services used', style: GoogleFonts.poppins(fontSize: 16)),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 16,
                children: [
                  _iconCounter("assets/Motorcycle.png", '16'),
                  const SizedBox(width: 12),
                  _iconCounter("assets/Package.png", '05'),
                ],
              ),
              // Comment Services
              Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),

                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Comment services',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.add, size: 20),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Leaved comments', style: TextStyle(fontSize: 16)),
                  Text('15', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              Divider(),
              CommentCard(
                name: 'Liam Ford',
                comment:
                    "The best driver so far he's so safe when he's driving - Read More",
                date: 'Monday, 12 March 2025',
                rating: 4,
                color: Colors.blue,
              ),
              CommentCard(
                name: 'Deep seek',
                comment:
                    "The best deliver so far he's so safe when he's driving - Read More",
                date: 'Monday, 6 March 2025',
                rating: 4,
                color: Colors.red,
              ),
              Text(
                'Turbo services',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TurboService(
                color: Color(0xFF161CCC),
                padding: EdgeInsets.all(4),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 22,
                      backgroundImage: AssetImage('assets/moto.png'),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        'Live search ...\n3 Found',
                        style: TextStyle(color: Colors.white),
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
      ),
    );
  }

  Widget _iconCounter(String icon, String count) {
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
