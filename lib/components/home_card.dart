import 'package:app_school/constantes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class HomeCard extends StatelessWidget {
  const HomeCard(
      {super.key,
        required this.onPress,
        required this.title,
        required this.icon});
  final VoidCallback onPress;
  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.only(top: kDefaultPadding / 2),
        width: MediaQuery.of(context).size.width / 2.5,
        height: MediaQuery.of(context).size.height / 6,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(kDefaultPadding / 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              width: 60.0,
              height: 60.0,
              colorFilter:
              const ColorFilter.mode(kOtherColor, BlendMode.srcATop),
            ),
            Text(title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w800,
                    fontSize: 20.0,
                    color: kOtherColor)),
            const SizedBox(
              height: kDefaultPadding / 3,
            ),
          ],
        ),
      ),
    );
  }
}
