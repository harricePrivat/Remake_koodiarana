import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/input.dart';
import '../components/shad_button.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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
              InputKoodiarana(
                placeholder: Text("Confirm Password"),
                controller: controllerPassword,
                trailing: Icon(Icons.lock_outline, color: Colors.grey[500]),
              ),
              ButtonKoodiarana(
                child: Text(
                  "Sign In ",
                  style: GoogleFonts.poppins(fontSize: 22),
                ),
                onTap: () {},
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
                    "Log in",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 16,

                      decoration: TextDecoration.underline,
                    ),
                  ),
                  IconButton(onPressed: () {},icon: Image.asset("assets/frame40.png"),),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 32, right: 32),
                child: Divider(),
              ),
              ButtonKoodiarana(
                color: Colors.grey[300],
                onTap: () {},
                child: Row(
                  spacing: 8,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("assets/Facebook.png", width: 25, height: 25),
                    Text(
                      "Se connecter avec Facebook",
                      style: GoogleFonts.poppins(color: Colors.black),
                    ),
                  ],
                ),
              ),
              ButtonKoodiarana(
                color: Colors.grey[300],
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
}
