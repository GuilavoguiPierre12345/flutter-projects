import 'package:app_school/constantes.dart';
import 'package:flutter/material.dart';

class AssignmentDetailRow extends StatelessWidget {
  const AssignmentDetailRow(
      {super.key, required this.title, required this.statusValue});
  final String title;
  final String statusValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 14.0,
              color: kContainerColor,
              fontWeight: FontWeight.w600),
        ),
        Text(
          statusValue,
          style: const TextStyle(
              fontSize: 14.0,
              color: kContainerColor,
              fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

class AssignmentButton extends StatelessWidget {
  const AssignmentButton(
      {super.key, required this.title, required this.onPress});

  final String title;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        height: 40.0,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [kSecondaryColor, kPrimaryColor],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(0.5, 0.0),
              stops: [0.0, 0.1]),
          borderRadius: BorderRadius.circular(kDefaultPadding),
        ),
        child: Center(
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 20.0, fontWeight: FontWeight.w500, color: kOtherColor),
            )),
      ),
    );
  }
}