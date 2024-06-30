
import 'package:app_school/screens/assignmentScreen/assignment_screen.dart';
import 'package:app_school/screens/change_password_screen/change_password_screen.dart';
import 'package:app_school/screens/datasheet_screen/datasheet_screen.dart';
import 'package:app_school/screens/fee_screen/fee_screen.dart';
import 'package:app_school/screens/home_screen/home_screen.dart';
import 'package:app_school/screens/login_screen/login_screen.dart';
import 'package:app_school/screens/my_profile/my_profile.dart';
import 'package:app_school/screens/register_screen/register_screen.dart';
import 'package:app_school/screens/result_screen/result_screen.dart';
import 'package:app_school/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routes = {
//   la definition de toutes les routes ici
    SplashScreen.routeName : (context)=>const SplashScreen(),
    LoginScreen.routeName : (context)=> const LoginScreen(),
    RegisterScreen.routeName : (context)=> const RegisterScreen(),
    HomeScreen.routeName : (context)=> HomeScreen(),
    MyProfileScreen.routeName : (context)=> const MyProfileScreen(),
    FeeScreen.routeName : (context)=> const FeeScreen(),
    AssignmentScreen.routeName : (context)=> const AssignmentScreen(),
    DataSheetScreen.routeName : (context)=> const DataSheetScreen(),
    ResultScreen.routeName : (context)=> const ResultScreen(),
    ChangePasswordScreen.routeName : (context)=> const ChangePasswordScreen(),

};