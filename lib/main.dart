import 'package:app_school/constantes.dart';
import 'package:app_school/routes.dart';
import 'package:app_school/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:image_picker/image_picker.dart';

void main() async{
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context,orientation,device){
      return  MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'School App',
          theme: ThemeData.light().copyWith(
              scaffoldBackgroundColor: kPrimaryColor,
              appBarTheme: AppBarTheme.of(context).copyWith(
                  backgroundColor: kPrimaryColor,
                  elevation: 0,
                  centerTitle: false,
                  titleTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: kTextWhiteColor,
                      fontSize: 28
                  )
              ),
              primaryColor: kPrimaryColor,
              textTheme: GoogleFonts.sourceSans3TextTheme(
                Theme.of(context).textTheme.copyWith(
                    bodyLarge: const TextStyle(
                        color: kTextWhiteColor,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w300),
                    bodyMedium:
                    const TextStyle(fontSize: 28.0, color: kTextBlackColor),
                    titleMedium: const TextStyle(
                        color: kTextWhiteColor,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w300)),
              ),
              inputDecorationTheme: const InputDecorationTheme(
                labelStyle: TextStyle(
                    height: 0.6, fontSize: 30.0, color: kTextBlackColor),
                hintStyle: TextStyle(
                    height: 0.6, fontSize: 16.0, color: kTextBlackColor),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: kContainerColor, width: .8)),
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: kContainerColor, width: .8)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor, width: .8)),
                errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: kErrorBorderColor,
                    )),
                focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: kErrorBorderColor, width: .8)),
              )),
          initialRoute: SplashScreen.routeName,
          routes: routes);
    });
  }
}
