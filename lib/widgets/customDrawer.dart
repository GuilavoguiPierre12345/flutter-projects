import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:telico_flutter/utils/global_variables.dart';

Drawer customDrawer(BuildContext context) {
  return Drawer(
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(60))),
          width: MediaQuery.of(context).size.width,
          height: 270,
          child: DrawerHeader(
            child: Column(
              children: [
                Container(
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage("assets/images/uservert.png"),
                  ),
                ),
                makeSpace(h: 10),
                Text("GUILAVOGUI FOROMO PIERRE")
              ],
            ),
          ),
        ),
        Expanded(
            child: Container(
          alignment: Alignment.bottomCenter,
          child: GestureDetector(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.logout,
                      color: Color(0xFF0D9276),
                      size: 40,
                    )),
                const Text(
                  "Deconnexion",
                  style: TextStyle(fontSize: 24, color: Color(0xFF0D9276)),
                )
              ],
            ),
          ),
        ))
      ],
    ),
  );
}
