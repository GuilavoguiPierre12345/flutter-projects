import 'dart:async';

import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:projet_application/database.dart';
import 'package:projet_application/entity/user_entity.dart';
import 'package:projet_application/screens/home.dart';
import 'package:projet_application/screens/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // creation de l'instance de la base de donnee
  // dans le main histoire de ne pas avoir plusieurs instance de la base de donnee
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();


  List<Utilisateur> users = await database.userDao.findAllUser();
  for (var user in users) {
    print("${user.id} - ${user.nom} - ${user.prenom}");
  }

  runApp(MyFirstApp(database: database));
}

class MyFirstApp extends StatelessWidget {

    AppDatabase database;
    MyFirstApp({super.key, required this.database});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // pour la gestion du state avec GetX
      navigatorKey: Get.key,
      title: "My First App",
      home:LoginPage(databaseInstance:database),
      supportedLocales: const [
        Locale('en'),
        Locale('fr'),
      ],
      // pour la prise en charge des messages d'erreur dans le formulaire
      localizationsDelegates: const [
        FormBuilderLocalizations.delegate,
      ],
      
    );
  }
}
