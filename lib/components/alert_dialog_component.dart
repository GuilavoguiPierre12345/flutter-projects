import 'package:app_school/constantes.dart';
import 'package:flutter/material.dart';

AlertDialog alertDialog(
    {required contentMessage,
    required IconData icon,
    required Color iconColor,
    required double alertHauteur,
      required context
    }) {
  return AlertDialog(
    actions: [
      TextButton(onPressed: (){Navigator.of(context).pop();}, child: const Text("OK",style: TextStyle(fontSize: 20.0),))
    ],
    contentPadding:
        const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 10.0),
    icon: Icon(
      icon,
      color: iconColor,
      size: 50,
    ),
    content: Container(
      height: alertHauteur,
      width: double.infinity,
      margin: EdgeInsets.zero,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(kDefaultPadding)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            contentMessage,
            style: const TextStyle(
                fontSize: 24.0,
                color: Colors.black,
                fontWeight: FontWeight.w800),
          ),
        ],
      ),
    ),
  );
}

void showCustomDialog(
    {required scontext,
    required String scontentMessage,
    required IconData sicon,
    required Color siconColor,
    required double salertHauteur,
    required}) {
    showDialog(
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(1),
        context: scontext,
        builder: (ctx){
          return alertDialog(
              context: scontext,
              contentMessage: scontentMessage,
              icon: sicon,
              iconColor: siconColor,
              alertHauteur: salertHauteur);
        }
    );

}
