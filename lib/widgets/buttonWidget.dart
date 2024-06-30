import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget customButtonWidget({required String buttonText, required Color color}) {
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color),
            elevation: MaterialStateProperty.all(10)),
        child: Text(
          buttonText,
          style: const TextStyle(color: Colors.white),
        )),
  );
}
