import 'package:app_school/constantes.dart';
import 'package:flutter/material.dart';

class FeeDetailRow extends StatelessWidget {
  const FeeDetailRow(
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
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontSize: 18.0, color: kContainerColor),
        ),
        Text(
          statusValue,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 20.0,
              color: kTextBlackColor,
              fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}

class FeeButton extends StatelessWidget {
  const FeeButton(
      {super.key,
        required this.title,
        required this.iconData,
        required this.onPress});
  final String title;
  final IconData iconData;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40.0,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [kSecondaryColor, kPrimaryColor]),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(kDefaultPadding),
            bottomRight: Radius.circular(kDefaultPadding),
          )),
      child: InkWell(
        onTap: onPress,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: kTextWhiteColor, fontWeight: FontWeight.w700),
          ),
          Icon(
            iconData,
            size: 30.0,
            color: kTextWhiteColor,
          )
        ]),
      ),
    );
  }
}