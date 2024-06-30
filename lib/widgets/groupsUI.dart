// import 'package:flutter/material.dart';
// import 'package:flutter_contacts/contact.dart';
//
// class GroupsUI {
//   /* le constructeur de la classe */
//   GroupsUI({required this.permissionValid});
//
//   /* les attributs de la classe */
//   bool permissionValid;
//   List<Contact>? contacts;
//
//   String _currentContactId = '';
//   String get currentContactId => _currentContactId;
//   /*
//     cette methode contien l'ui de la liste des contacts
//    */
//   Widget listGroupsUI() {
//     if(!permissionValid) return const Center(child: CircularProgressIndicator(),);
//     if(contacts == null) return const Center(child: CircularProgressIndicator(color: Colors.red, strokeWidth: 6.0,),);
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
//                 const SizedBox(width: 7.0,),
//                  Container(
//                   width: MediaQuery.of(ctx).size.width/2,
//                   child: Text(currentValue.displayName,
//                     softWrap: true,
//                     overflow: TextOverflow.ellipsis,
//                     style: const TextStyle(color: Colors.black),
//                   ),
//                 ),
//                 const Spacer(),
//                 const IconButton(onPressed: null, icon: Icon(Icons.edit,color: Colors.green,)),
//                 IconButton(icon:const  Icon(Icons.delete,color: Colors.red,),onPressed: (){ _currentContactId = currentValue.id ;},),
//               ],
//             ),
//           );
//         }
//     );
//   }
//
//   /* cette methode permet d'ajouter un contact*/
//   Widget addGroupUI() {
//     return const Center(child: Text("ADD GROUP UI"),);
//   }
//
//
// }
