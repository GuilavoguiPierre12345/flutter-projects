import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telico_flutter/screens/contact_page.dart';
import 'package:telico_flutter/screens/home_page.dart';
import 'package:telico_flutter/screens/login_page.dart';
import 'package:telico_flutter/screens/register_page.dart';
import 'package:telico_flutter/utils/global_variables.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: themeColor),
        useMaterial3: true,
      ),
      home: const ContactPage(),
    );
  }
}
