import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

class ContactProvider with ChangeNotifier {
  List<Contact> contacts = [];
  bool permission = false;

  final TextEditingController controller = TextEditingController();

    activePermission() async {
    if ( await FlutterContacts.requestPermission()) {
      permission = true;
      notifyListeners();
    }
  }

   /* recuperation de la liste des contacts du telephone*/
  getAllContacts() async {
    if (await FlutterContacts.requestPermission(readonly: true)) {
      List<Contact> cts = await FlutterContacts.getContacts();
      contacts = cts;
      notifyListeners();
    }
  }

  /* rechercher un contact */
  searchContact() {
    if (controller.text.isNotEmpty) {

    }
  }

  /* supprimer un contact dans le telephone */
  deleteContact(String delContactId) async {
    final contact = await FlutterContacts.getContact(delContactId);
    await contact!.delete();
    print("delete success");
    getAllContacts();
  }

  /* modifier un contact */
  updateContact(String updateContactId) async {
    Contact? contact = await FlutterContacts.getContact(updateContactId);
    await FlutterContacts.updateContact(contact!);
    getAllContacts();
  }

  /* ajouter un contact*/
  // addContact() async {
  //
  // }

}