import 'package:flutter/cupertino.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

class ContactService {

  List<Contact>? _contacts;
  bool _permissionValid = false ;

  bool get permissionValid => _permissionValid;
  List<Contact>? get contactsList => _contacts ;

  set setContactList(List<Contact> cts) {
    _contacts = cts;
  }

  /*listContacts : obtenir la liste des contacts du telephone*/
  void listContacts() async {
    if(await FlutterContacts.requestPermission())  {
      _permissionValid = true;
      _contacts =  await FlutterContacts.getContacts();
    }
  }

  /*deleteSingleContact : la suppression d'un contact en foction de son id*/
  void deleteSingleContact(String id) async {
      Contact? delContact = await FlutterContacts.getContact(id);
      await FlutterContacts.deleteContact(delContact!);
      print("sup valide, recuperation nouvelle liste");
  }
}