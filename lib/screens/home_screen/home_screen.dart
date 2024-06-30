import 'package:app_school/components/home_card.dart';
import 'package:app_school/constantes.dart';
import 'package:app_school/screens/assignmentScreen/assignment_screen.dart';
import 'package:app_school/screens/change_password_screen/change_password_screen.dart';
import 'package:app_school/screens/datasheet_screen/datasheet_screen.dart';
import 'package:app_school/screens/fee_screen/fee_screen.dart';
import 'package:app_school/screens/home_screen/widgets/student_year.dart';
import 'package:app_school/screens/my_profile/my_profile.dart';
import 'package:flutter/material.dart';

import '../result_screen/result_screen.dart';
import 'widgets/student_class.dart';
import 'widgets/student_data.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  static String routeName = "HomeScren";
  @override
  Widget build(BuildContext context) {
    final newUserInfos = ModalRoute.of(context)?.settings.arguments;
    print(newUserInfos);
    return Scaffold(
      body: Column(
        children: [
          // nous partegerons l'ecran en deux parties
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.5,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                     const Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          StudentName(studentName: "Yaboigui Guilavogui"),
                          halfSizeBox,
                          StudentClass(
                            studentClass:
                                "Niveau Etude 11 SM A | Group P no : 12",
                          ),
                          halfSizeBox,
                          StudentYear(
                            studentYear: "2023 - 2024",
                          ),
                        ],
                      ),
                    ),
                    halfSizeBox,
                    StudentPicture(
                        pictureAdress: "assets/images/splashimage.png",
                        onPress: () {
                          //   go to user profile screen
                          Navigator.pushNamed(
                              context, MyProfileScreen.routeName);
                        }),
                  ],
                ),
                sizeBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    StudentDataCard(
                        onPress: () {
                          // go to attendance scrren
                        },
                        title: "Attendance",
                        value: "90.01 %"),
                    StudentDataCard(
                        onPress: () {
                          //   go to feeds due screen
                          Navigator.pushNamed(context, FeeScreen.routeName);
                        },
                        title: "Feeds",
                        value: "GNF 3.400.000"),
                  ],
                ),
              ],
            ),
          ),

          Expanded(
            child: Container(
              color: Colors.transparent,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: kOtherColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(kDefaultPadding * 3),
                        topRight: Radius.circular(kDefaultPadding * 3))),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(
                      top: kDefaultPadding, bottom: kDefaultPadding),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                            onPress: () {},
                            title: "Take Quiz",
                            icon: "assets/icons/quiz.svg"),
                        HomeCard(
                            onPress: () {
                            //   go to assignment screen
                              Navigator.pushNamed(context, AssignmentScreen.routeName);
                            },
                            title: "Assignements",
                            icon: "assets/icons/assignements.svg"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                            onPress: () {},
                            title: "Holidays",
                            icon: "assets/icons/holidays.svg"),
                        HomeCard(
                            onPress: () {},
                            title: "Time Table",
                            icon: "assets/icons/timetable.svg"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                            onPress: () {
                            //   go to result screen
                              Navigator.pushNamed(context, ResultScreen.routeName);
                            },
                            title: "Results",
                            icon: "assets/icons/result.svg"),
                        HomeCard(
                            onPress: () {
                            //   go to datasheets screen
                              Navigator.pushNamed(context, DataSheetScreen.routeName);
                            },
                            title: "DateSheets",
                            icon: "assets/icons/datasheet.svg"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                            onPress: () {},
                            title: "Ask",
                            icon: "assets/icons/ask.svg"),
                        HomeCard(
                            onPress: () {},
                            title: "Gallery",
                            icon: "assets/icons/gallery.svg"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                            onPress: () {},
                            title: "Leave Application",
                            icon: "assets/icons/leaveapplication.svg"),
                        HomeCard(
                            onPress: () {
                            //   go to change password screen
                              Navigator.pushNamed(context, ChangePasswordScreen.routeName);
                            },
                            title: "Change Password",
                            icon: "assets/icons/changepassword.svg"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                            onPress: () {},
                            title: "Events",
                            icon: "assets/icons/events.svg"),
                        HomeCard(
                            onPress: () {},
                            title: "Logout",
                            icon: "assets/icons/logout.svg"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
