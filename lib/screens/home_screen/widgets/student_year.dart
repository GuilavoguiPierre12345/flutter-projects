import 'package:app_school/constantes.dart';
import 'package:flutter/material.dart';

class StudentYear extends StatelessWidget {
  const StudentYear({super.key, required this.studentYear});
  final String studentYear;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 100,
      height: 20,
      decoration: BoxDecoration(
          color: kOtherColor,
          borderRadius:
          BorderRadius.circular(kDefaultPadding)),
      child: Text(
        studentYear,
        style: const TextStyle(
            color: kTextBlackColor,
            fontSize: 16.0,
            fontWeight: FontWeight.w800),
      ),
    );
  }
}
