import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Brice Privat")),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(icon:Image.asset("assets/bottom1.png",width: 24,height: 24,),label: "Accueil" ),
          BottomNavigationBarItem(icon: Image.asset("assets/bottom2.png",width: 24,height: 24,),label: "Money"),
          BottomNavigationBarItem(icon: Image.asset("assets/bottom3.png"),label: "Profil"),
        ],
      ),
    );
  }
}
