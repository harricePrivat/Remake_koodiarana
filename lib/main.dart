import 'package:flutter/material.dart';
// import 'package:koodiarana_cl/screens/pages/first_login.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:koodiarana_cl/screens/pages/splash_screen.dart';
import 'package:koodiarana_cl/services/app_router.dart';
// import 'package:koodiarana_cl/screens/pages/signup.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ShadApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen()
    );
  }
}
