import 'package:app_school/constantes.dart';
import 'package:app_school/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  // route name for our screen
  static String routeName = 'SplashScreen';
  @override
  Widget build(BuildContext context) {
    // we use Future to go from on screen  to other via duration time
    Future.delayed(const Duration(seconds: 5),(){
      Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routeName, (route) => false);
    });

    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("School",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: kTextWhiteColor,
                          fontSize: 40.0,
                          fontStyle: FontStyle.italic,
                          letterSpacing: 2.3,
                        )),
                Text("YABOIGUI",
                    style: GoogleFonts.pacifico(
                        fontStyle: FontStyle.italic,
                        fontSize: 25.0,
                        color: kTextWhiteColor,
                        letterSpacing: 1.9,
                        fontWeight: FontWeight.w700)),
              ],
            ),
            Expanded(
                child: Image.asset(
              "assets/images/profil.png",
              height: 50.h,
              width: 50.w,
            ))
          ],
        ),
      ),
    );
  }
}
