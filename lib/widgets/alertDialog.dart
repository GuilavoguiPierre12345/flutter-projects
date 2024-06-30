import 'package:flutter/material.dart';
import 'package:telico_flutter/utils/global_variables.dart';

Widget customAlertDialog({required BuildContext context}) {
  return AlertDialog(
    icon: Image.asset("assets/images/delete.png", width: 80, height: 80),
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.bold,
    ),
    titlePadding: const EdgeInsets.all(0),
    contentPadding: const EdgeInsets.all(0),
    content: Text(
      textAlign: TextAlign.center,
      "Voulez-vous supprimer cet element?",
      style: TextStyle(fontSize: 20, color: Colors.red),
    ),
    actions: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 4,
            child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(themeColor),
                    elevation: MaterialStateProperty.all(10)),
                child: Text(
                  "OUI",
                  style: const TextStyle(color: Colors.white),
                )),
          ),
          makeSpace(w: 5),
          SizedBox(
            width: MediaQuery.of(context).size.width / 4,
            child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                    elevation: MaterialStateProperty.all(15)),
                child: Text(
                  "NON",
                  style: const TextStyle(color: Colors.white),
                )),
          ),
        ],
      )
    ],
  );
}
