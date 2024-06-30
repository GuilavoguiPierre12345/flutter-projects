// import 'package:easy_contact/services/contactService.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_contacts/contact.dart';
//
// class ContactsUI {
//   /* le constructeur de la classe */
//   ContactsUI({required this.permissionValid, required this.contacts});
//
//   /* les attributs de la classe */
//   bool permissionValid;
//   List<Contact>? contacts;
//
//   ContactService cts = ContactService();
//
//
//
//   /*
//     cette methode contien l'ui de la liste des contacts
//    */
//   Widget listContactsUI() {
//     if(!permissionValid) return const Center(child: CircularProgressIndicator(),);
//     if(contacts == null) {
//         return  const Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//          mainAxisAlignment: MainAxisAlignment.center,
//
//          children: [
//            SizedBox(width: 50.0,),
//           CircularProgressIndicator(color: Colors.red, strokeWidth: 6.0,),
//           Text("Cliquer sur contacts list"),
//            SizedBox(width: 50.0,),
//           ],
//         );
//     }
//     return ListView.builder(
//         physics: const BouncingScrollPhysics(),
//         itemCount: contacts!.length,
//         itemBuilder: (ctx,i){
//           final colorNumber = int.parse(contacts![i].id);
//           dynamic currentValue = contacts![i] ;
//           return ListTile(
//             splashColor: Color.fromARGB(255, colorNumber, 150, 200),
//
//             title: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 CircleAvatar(
//                   backgroundColor: Color.fromARGB(255, colorNumber, 150, 200),
//                   minRadius: 20,
//                   maxRadius: 20,
//                   child: Text(contacts![i].displayName[0]),
//                 ),
//                 SizedBox(width: 7.0,),
//                 Container(
//                   width: MediaQuery.of(ctx).size.width/2,
//                   child: Text(currentValue.displayName,
//                     softWrap: true,
//                     overflow: TextOverflow.ellipsis,
//                     style: const TextStyle(color: Colors.black),
//                   ),
//                 ),
//                 const Spacer(),
//                 const IconButton(onPressed: null, icon: Icon(Icons.edit,color: Colors.green,)),
//                 IconButton(icon: const Icon(Icons.delete,color: Colors.red,), onPressed: () => cts.deleteSingleContact(currentValue.id) ),
//               ],
//             ),
//           );
//         }
//     );
//   }
//
//   /* cette methode permet d'ajouter un contact*/
//   Widget addContactUI() {
//     return Center(child: Text("ADD CONTACT UI"),);
//   }
//
//   Widget deleteContactUI() {
//     return Center(child: Text("DELETE CONTACT UI"),);
//   }
//
// }
