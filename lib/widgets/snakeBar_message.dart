import 'package:flutter/material.dart';

class SnakeBarMessage {

  SnackBar snackBar(String contactDisplayName) {
    return SnackBar(
        content: RichText(
            text: TextSpan(
              children: [
                TextSpan(text: contactDisplayName,
                    style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 20.0)),
                const TextSpan(text: ' deleted with success!',
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 18.0)),
              ]
            )
        ) ,
        elevation: 20,
        backgroundColor: Colors.black,
    );
  }

}