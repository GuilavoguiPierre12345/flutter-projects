import 'package:flutter/material.dart';
import 'package:telico_flutter/utils/global_variables.dart';

Widget customTextFormField(
    {bool isTextObscured = false,
    required TextEditingController controller,
    required IconData? prefixIcon,
    bool keyBoardType = false,
    required String hintText}) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: TextField(
      style: const TextStyle(fontSize: 20, color: Colors.grey),
      controller: controller,
      keyboardType: keyBoardType ? TextInputType.phone : TextInputType.text,
      decoration: InputDecoration(
          label: Text(hintText),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          prefixIcon: Icon(
            prefixIcon,
            size: 30,
            color: themeColor,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 24)),
    ),
  );
}
