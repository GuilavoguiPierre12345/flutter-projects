import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:projet_application/entity/user_entity.dart';

Widget createUser({required databaseInstance, required String typeAction, Utilisateur? initUser, required Function refreshUI}) {
  final formKey = GlobalKey<FormBuilderState>();
  return Container(
    child: FormBuilder(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormBuilderTextField(
              initialValue: typeAction=="add" ? "" : initUser!.prenom,
              name: 'prenom',
              decoration: const InputDecoration(labelText: 'Votre prenom'),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormBuilderTextField(
              initialValue: typeAction=="add" ? "" : initUser!.nom,
              name: 'nom',
              decoration: const InputDecoration(labelText: 'Votre nom'),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GFButton(
              onPressed: () async {
                if (formKey.currentState!.saveAndValidate()) {
                  // OPERATION D'AJOUT
                  if (typeAction=="add") {
                    await databaseInstance.userDao.insertUtilisateur(Utilisateur(
                        nom: formKey.currentState!.value["nom"],
                        prenom: formKey.currentState!.value["prenom"]));
                    refreshUI();
                    Get.back();
                  }

                  // OPERATION DE MISE A JOUR
                  if (typeAction == "update") {
                    await databaseInstance.userDao.updateUser(Utilisateur(
                        id: initUser!.id,
                        nom: formKey.currentState!.value["nom"],
                        prenom: formKey.currentState!.value["prenom"]));
                    refreshUI();
                    Get.back();
                  }
                }
              },
              color: GFColors.SUCCESS,
              size: GFSize.LARGE,
              fullWidthButton: true,
              text: typeAction=="add" ? "Ajouter" : "Update",
            ),
          ),
        ],
      ),
    ),
  );
}
