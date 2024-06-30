import 'package:app_school/constantes.dart';
import 'package:flutter/material.dart';

class StudentName extends StatelessWidget {
  const StudentName({super.key, required this.studentName});
  final String studentName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Hi ",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontSize: 20.0, fontWeight: FontWeight.w200),
        ),
        Text(
          studentName.length > 20 ? "${studentName.substring(0, 20)}...": studentName,
          softWrap: true,
          overflow: TextOverflow.fade,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontSize: 20.0, fontWeight: FontWeight.w500,),
        ),
      ],
    );
  }
}

class StudentPicture extends StatelessWidget {
  const StudentPicture({super.key, required this.pictureAdress, required this.onPress});
  final String pictureAdress;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child:  CircleAvatar(
        minRadius: 60.0,
        maxRadius: 60.0,
        backgroundColor: kSecondaryColor,
        backgroundImage: AssetImage(
          pictureAdress,
        ),
      ),
    );
  }
}

class StudentDataCard extends StatelessWidget {
  const StudentDataCard({super.key, required this.onPress, required this.title, required this.value});

  final VoidCallback onPress;
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: MediaQuery.of(context).size.width / 2.5,
        height: MediaQuery.of(context).size.height / 9,
        decoration: BoxDecoration(
            color: kOtherColor,
            borderRadius:
            BorderRadius.circular(kDefaultPadding)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 22.0,
                color: kTextBlackColor,
              ),
            ),
            Text(
              value,
              softWrap: true,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(
                fontWeight: FontWeight.w900,
                fontSize: 18.0,
                color: kTextBlackColor,
              ),
            ),
          ],
        ),
      ),
    );

  }
}


