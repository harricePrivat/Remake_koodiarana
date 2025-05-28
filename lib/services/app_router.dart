import 'package:go_router/go_router.dart';
import 'package:koodiarana_cl/screens/pages/first_login.dart';
import 'package:koodiarana_cl/screens/pages/home_page.dart';
import 'package:koodiarana_cl/screens/pages/login.dart';
import 'package:koodiarana_cl/screens/pages/phone_number.dart';
import 'package:koodiarana_cl/screens/pages/signup.dart';

class AppRouter {
  final router = GoRouter(
    initialLocation: "/homepage",
    routes: [
      GoRoute(path: '/sign-up', builder: (context, state) =>Signup()),
      GoRoute(path: "/first-login",builder: (context,state)=>FirstLogin()),
      GoRoute(path: "/phone-number",builder: (context,state)=> PhoneNumber()),
      GoRoute(path: "/login",builder: (context,state)=> Login()),
      GoRoute(path: "/homepage",builder: (context,state)=> HomePage())
    ],
    // redirect: (context, state) {
    //   return 'null';
    // },
  );
}
