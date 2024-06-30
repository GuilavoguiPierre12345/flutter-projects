import 'package:app_school/constantes.dart';
import 'package:flutter/material.dart';



class DefaultButton extends StatelessWidget {
  final VoidCallback onPress;
  final String title;
  final IconData iconData;

  const DefaultButton({super.key, required this.onPress,required this.title, required this.iconData});



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.only(left: kDefaultPadding,right: kDefaultPadding),
        padding: const EdgeInsets.only(right: kDefaultPadding),
        height: 60.0,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient:const LinearGradient(
                colors: [kPrimaryColor,kContainerColor],
                begin: FractionalOffset(0.0,0.0),
                end: FractionalOffset(0.0, 0.0),
                stops: [0.0,1.0],
                tileMode: TileMode.mirror
            ),
            borderRadius: BorderRadius.circular(kDefaultPadding)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Text(title,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            const Spacer(),
            Icon(iconData,size: 30.0,color: kOtherColor,),

          ],
        ) ,
      ),
    );
  }
}
