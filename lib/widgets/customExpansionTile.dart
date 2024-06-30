import 'package:flutter/material.dart';
import 'package:telico_flutter/widgets/alertDialog.dart';

Widget customExpansionTile({required BuildContext context}) {
  return Card(
    elevation: 15,
    child: ExpansionTile(
      leading: Icon(Icons.person),
      title: Text("Guilavogui"),
      subtitle: Text("+224 625506385"),
      children: [
        ListTile(
          leading: const Icon(Icons.location_city),
          title: Text("Republique de Guinee/Mamou-Telico"),
        ),
        ListTile(
          leading: const Icon(Icons.people),
          title: Text("Collegue de travail"),
        ),
        ListTile(
          leading: const Icon(Icons.email),
          title: Text("yaboigui@gmail.com"),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.phone_callback_rounded,
                        size: 40,
                        color: Color(0xFF40A2E3),
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.message,
                        size: 40,
                        color: const Color(0xFF40A2E3),
                      )),
                ],
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit_square,
                        size: 40,
                        color: Color(0xFF0A6847),
                      )),
                  IconButton(
                      onPressed: () {
                        showDialog(
                                  barrierDismissible: false,
                                  barrierColor: Colors.black.withOpacity(.85),
                                  context: context,
                                  builder: (context) =>
                                      customAlertDialog(context: context));
                      },
                      icon: Icon(
                        Icons.delete,
                        size: 40,
                        color: Colors.red,
                      )),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
