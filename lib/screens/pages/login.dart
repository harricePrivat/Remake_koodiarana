import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koodiarana_cl/screens/components/shad_button.dart';
import 'package:koodiarana_cl/screens/components/input.dart';
// import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart' as sd;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.00),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 12,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 20),
              Image.asset(
                width: MediaQuery.of(context).size.width - 32,
                height: 300,
                "assets/koodiarana-removebg.png",
              ),
              InputKoodiarana(
                placeholder: Text("E-mail"),
                controller: controllerEmail,
                trailing: Icon(Icons.email_outlined, color: Colors.grey[500]),
              ),
              InputKoodiarana(
                placeholder: Text("Password"),
                controller: controllerPassword,
                trailing: Icon(Icons.lock_outline, color: Colors.grey[500]),
              ),
              ButtonKoodiarana(
                child: sd.Text("Log in ", style: TextStyle(fontSize: 22)),
                onTap: () {
                  context.go("/homepage");
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 4,
                children: [
                  Text(
                    "Still dont'have an account ",
                    style: textTheme.displaySmall,
                  ),
                  Text(
                    "Sign up",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w800,
                      fontSize: 12,

                      decoration: TextDecoration.underline,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      context.push("/sign-up");
                    },
                    icon: Image.asset("assets/frame40.png"),
                  ),
                ],
              ),

              Padding(
                padding: EdgeInsets.only(left: 32, right: 32),
                child: Divider(),
              ),
              ButtonKoodiarana(
                color: Colors.grey[300],
                pressedBackgroundColor: Colors.grey[400],
                onTap: () {},
                child: Row(
                  spacing: 8,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("assets/Facebook.png", width: 20, height: 20),
                    Text(
                      "Se connecter avec Facebook",
                      style: GoogleFonts.poppins(color: Colors.black),
                    ),
                  ],
                ),
              ),
              ButtonKoodiarana(
                color: Colors.grey[300],
                pressedBackgroundColor: Colors.grey[400],
                onTap: () {},
                child: Row(
                  spacing: 8,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("assets/google.png", width: 20, height: 20),
                    Text(
                      "Se connecter avec Google",
                      style: GoogleFonts.poppins(color: Colors.black),
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

  @override
  void dispose() {
    super.dispose();
    controllerEmail.dispose();
    controllerPassword.dispose();
  }
}
