import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:koodiarana_cl/bloc/get_name_position/get_name_position_bloc.dart';
import 'package:koodiarana_cl/providers/bottom_management.dart';
import 'package:koodiarana_cl/providers/scroll1_management.dart';
import 'package:koodiarana_cl/screens/pages/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (context) => GetNamePositionBloc())],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => BottomManagement()),
          ChangeNotifierProvider(create: (context) => Scroll1Management()),
        ],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ShadApp(debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}
