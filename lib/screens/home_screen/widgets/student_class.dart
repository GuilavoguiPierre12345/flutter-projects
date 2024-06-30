import 'package:flutter/material.dart';

class StudentClass extends StatelessWidget {
  const StudentClass({super.key, required this.studentClass});
  final String studentClass;
  @override
  Widget build(BuildContext context) {
    return Text(
      studentClass,
      style: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(fontSize: 20.0),
    );
  }
}
