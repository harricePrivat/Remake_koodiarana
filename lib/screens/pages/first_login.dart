import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koodiarana_cl/screens/components/shad_button.dart';
import './delayed_animation.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FirstLogin extends StatefulWidget {
  const FirstLogin({super.key});

  @override
  State<FirstLogin> createState() => _FirstLoginWork();
}

class _FirstLoginWork extends State<FirstLogin> {
  final controller = PageController();
  // final Color rwColor = const Color(Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0.0,
      //   title: Center(child: buildIndicator(color)),
      //   //  DelayedAnimation(
      //   //   delay: 30,
      //   //   child: Text('Koodiarana Tips', style: TextStyle(color: color)),
      //   // ),
      // ),
      body: SizedBox.expand(
        child: Stack(
          children: [
            SafeArea(child: Column(children: [Expanded(child: buildPages())])),
            Positioned(
              top: 50,
              left:
                  (MediaQuery.of(context).size.width - 30) /
                  2, // Centre horizontalement
              child: SmoothPageIndicator(
                controller: controller,
                count: 2,
                effect: WormEffect(activeDotColor: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget buildPages() {
    return PageView(
      controller: controller,
      children: [
        onboardPageView(
          'Je suis votre employer',
          "assets/4dd6a437-c139-49a4-8e95-5532dcafa3c11.png",
        ),
        onboardPageView(
          'Cook with step by step instructions!',
          "assets/scroll2.png",
        ),
      ],
    );
  }

  Widget onboardPageView(String text, String image) {
    return Stack(
      children: [
        Positioned.fill(child: Image.asset(fit: BoxFit.cover, image)),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent, // Transparent en haut
                  Colors.white.withValues(
                    alpha: 0.8,
                  ), // Presque blanc au milieu
                  Colors.white, // Totalement blanc en bas
                ],
                stops: [0.0, 0.7, 1.0], // Contrôle la répartition du dégradé
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 200,
          child: Image.asset(
            width: 200,
            height: 200,
            "assets/koodiarana-removebg.png",
          ),
        ),
        Positioned(
          left: 32,
          bottom: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              Text(
                text,
                style: GoogleFonts.poppins(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              Text(
                "Test de widget",
                style: GoogleFonts.poppins(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              ButtonKoodiarana(
                onTap: () {},
                child: Text(
                  "Commencer!!!",
                  style: GoogleFonts.poppins(),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildIndicator(Color color) {
    return DelayedAnimation(
      delay: 300,
      child: SmoothPageIndicator(
        controller: controller,
        count: 2,
        effect: WormEffect(activeDotColor: color),
      ),
    );
  }
}
