import 'package:flutter/material.dart';

Widget customNavBar(
    {required BuildContext context,
    required int currentIndex,
    required Function changePageIndex,
    required Function setState}) {
  return BottomNavigationBar(
      iconSize: 28,
      selectedFontSize: 18,
      elevation: 10,
      currentIndex: currentIndex,
      onTap: (int newIndex) {
        setState(() {
          changePageIndex(newIndex);
        });
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Acceuil"),
        BottomNavigationBarItem(icon: Icon(Icons.people_alt), label: "Groupes"),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle), label: "Compte"),
      ]);
}
