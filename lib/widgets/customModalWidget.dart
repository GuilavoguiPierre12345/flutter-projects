import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:telico_flutter/utils/global_variables.dart';
import 'package:telico_flutter/widgets/buttonWidget.dart';
import 'package:telico_flutter/widgets/textInput.dart';

Widget customModalDialog({required BuildContext context}) {
  final _formKey = GlobalKey<FormState>();
  TextEditingController loginController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  return AlertDialog(
    title: Container(
      alignment: Alignment.center,
      height: 50,
      decoration: BoxDecoration(
          color: themeColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: const Text(
        textAlign: TextAlign.center,
        "REINITIALISER LE MOT DE PASSE",
        style: TextStyle(fontSize: 16),
      ),
    ),
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.bold,
    ),
    titlePadding: const EdgeInsets.all(0),
    contentPadding: const EdgeInsets.all(0),
    content: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 2.3,
        width: MediaQuery.of(context).size.width,
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                customTextFormField(
                    controller: loginController,
                    prefixIcon: Icons.person,
                    hintText: "Identifiant"),
                makeSpace(h: 15),
                customTextFormField(
                    controller: newPasswordController,
                    prefixIcon: Icons.person_outlined,
                    hintText: "Mot de passe"),
                makeSpace(h: 15),
                customTextFormField(
                    controller: passwordConfirmationController,
                    keyBoardType: true,
                    prefixIcon: Icons.phone,
                    hintText: "Confirmation"),
                makeSpace(h: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.red),
                              elevation: MaterialStateProperty.all(10)),
                          child: Text(
                            "Annuler",
                            style: const TextStyle(color: Colors.white),
                          )),
                    ),
                    makeSpace(w: 5),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(themeColor),
                              elevation: MaterialStateProperty.all(15)),
                          child: Text(
                            "Valider",
                            style: const TextStyle(color: Colors.white),
                          )),
                    ),
                  ],
                )
              ],
            )),
      ),
    ),
  );
}
