import 'package:flutter/material.dart';
import 'package:koodiarana_cl/providers/bottom_management.dart';
import 'package:koodiarana_cl/screens/pages/page1.dart';
import 'package:koodiarana_cl/screens/pages/page2.dart';
import 'package:koodiarana_cl/screens/pages/page3.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pages = [GoogleMaps(), Page2(), Page3()];
  @override
  Widget build(BuildContext context) {
    return Consumer<BottomManagement>(
      builder: (context, bottomManager, child) {
        return Scaffold(
          body: pages[bottomManager.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            showUnselectedLabels: false,
            showSelectedLabels: true,
            backgroundColor: Colors.transparent,
            currentIndex: bottomManager.currentIndex,
            onTap: (value) {
              bottomManager.changeIndex(value);
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
      },
    );
  }
}
