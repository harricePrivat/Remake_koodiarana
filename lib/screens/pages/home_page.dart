import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pages = [Text("Page 1"), Text("Page 2"), Text("Page 3")];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: pages[currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        showSelectedLabels: true,
        backgroundColor: Colors.transparent,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              "assets/bottom1.png",
              width: 30,
              height: 30,
            ),
            icon: Image.asset("assets/bottom1.png", width: 24, height: 24),
            label: "Accueil",
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              "assets/bottom2.png",
              width: 30,
              height: 30,
            ),

            icon: Image.asset("assets/bottom2.png", width: 24, height: 24),
            label: "Money",
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              "assets/bottom3.png",
              width: 40,
              height: 40,
            ),

            icon: Image.asset("assets/bottom3.png", width: 30, height: 30),
            label: "Profil",
          ),
        ],
      ),
    );
  }
}
