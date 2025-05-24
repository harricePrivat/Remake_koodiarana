import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koodiarana_cl/screens/components/input.dart';
import 'package:koodiarana_cl/screens/components/shad_button.dart';
// import 'package:go_router/go_router.dart';

// ignore: must_be_immutable
class PhoneNumber extends StatelessWidget {
  PhoneNumber({super.key});
  TextEditingController num = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.00),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 16,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 20),
              Image.asset(
                width: MediaQuery.of(context).size.width - 32,
                height: 300,
                "assets/koodiarana-removebg.png",
              ),
              Text("Enter your phone number", style: textTheme.displaySmall),
                  InputKoodiarana(
                    height: 50,
                    placeholder: Text("Phone number"),
                    controller: num,
                    textInputType: TextInputType.number,
                    //   trailing: Icon(Icons.lock_outline, color: Colors.grey[500]),
                  ),
               

              ButtonKoodiarana(
                onTap: () {},
                child: Text("Confirm", style: GoogleFonts.poppins()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
