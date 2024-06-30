import 'package:flutter/material.dart';
import 'package:telico_flutter/widgets/customExpansionTile.dart';

Widget AccueilPage(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(.4),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: TextField(
              style: const TextStyle(fontSize: 20),
              decoration: InputDecoration(
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 30,
                  ),
                  label: const Text(
                    "Rechercher",
                    style: TextStyle(fontSize: 24),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Rechercher",
                  hintStyle: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 18,
                      color: Colors.grey.withOpacity(.7))),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              customExpansionTile(context: context),
              customExpansionTile(context: context),
              customExpansionTile(context: context),
            ],
          ),
        )
      ],
    ),
  );
}
