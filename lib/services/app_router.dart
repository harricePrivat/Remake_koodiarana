import 'package:go_router/go_router.dart';
import 'package:koodiarana_cl/screens/pages/first_login.dart';
import 'package:koodiarana_cl/screens/pages/phone_number.dart';
import 'package:koodiarana_cl/screens/pages/signup.dart';

class AppRouter {
  final router = GoRouter(
    initialLocation: "/phone-number",
    routes: [
      GoRoute(path: '/sign-up', builder: (context, state) =>Signup()),
      GoRoute(path: "/first-login",builder: (context,state)=>FirstLogin()),
      GoRoute(path: "/phone-number",builder: (context,state)=> PhoneNumber())
    ],
    // redirect: (context, state) {
    //   return 'null';
    // },
  );
}
