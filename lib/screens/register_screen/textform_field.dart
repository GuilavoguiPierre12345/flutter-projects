import 'package:app_school/constantes.dart';
import 'package:flutter/material.dart';

Padding textFormField({required BuildContext context,
    required VoidCallback onPress,
    required String htext,
    required String ltext,
    required TextInputType inputType,
    bool obscureText = false,
    required TextEditingController controllervalue,
    IconData? picon,
    IconData? sicon}) {
  return Padding(
    padding: const EdgeInsets.only(left: 0.0,right: 0.0,top:10.0 ,bottom: 8.0),
    child: TextFormField(
      obscureText: obscureText,
      textAlign: TextAlign.start,
      keyboardType: inputType,
      style: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(color: kTextBlackColor, fontSize: 18.0),
      decoration: InputDecoration(
        filled: true,
        prefixIcon: Icon(
          picon,
          size: 24.0,
        ),
        suffixIcon: IconButton(onPressed: onPress, icon: Icon(
          sicon,
          size: 24.0,
        ),),
        labelText: ltext,
        hintText: htext,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        errorStyle: const TextStyle(color: Colors.red, fontSize: 20.0),
      ),
      controller: controllervalue,
      validator: (value) {
        if (value!.isEmpty) {
          return "ce champ est obligatoire";
        }
      },
    ),
  );
}
