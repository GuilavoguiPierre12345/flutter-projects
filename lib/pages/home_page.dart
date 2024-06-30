// import 'package:easy_contact/services/contactService.dart';
// import 'package:easy_contact/widgets/contactsUI.dart';
// import 'package:easy_contact/widgets/groupsUI.dart';
// import 'package:flutter/material.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   int _pageCurrentIndex = 0;
//   ContactService cts = ContactService();
//
//   /*
//     destinationSelected : une fonction qui change l'indice de la page lorqu'on clique sur un element de
//     la navigation
//    */
//   void destinationSelected(int index){
//     setState(() => _pageCurrentIndex = index);
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _pageCurrentIndex=0;
//     cts.listContacts();
//   }
//
//   // @override
//   // void setState(VoidCallback fn) {
//   //   super.setState(fn);
//   //   cts.listContacts();
//   //   print("object set state");
//   // }
//   @override
//   Widget build(BuildContext context) {
//     /*Les instances des classes*/
//     final ctsUI = ContactsUI(permissionValid: cts.permissionValid , contacts: cts.contactsList);
//     final gpsUI = GroupsUI(permissionValid: cts.permissionValid);
//
//     setState(() {
//       cts.listContacts();
//     });
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text("Easy contact manager",style: TextStyle(
//           fontSize: 20,
//           fontWeight: FontWeight.bold
//         ),
//         ),
//         actions: const  [
//            IconButton(onPressed: null, icon: Icon(Icons.sync), splashColor: Colors.white,),
//         ],
//       ),
//       body: [
//         ctsUI.listContactsUI(),
//         gpsUI.addGroupUI(),
//         ctsUI.addContactUI(),
//
//         ][_pageCurrentIndex],
//
//       bottomNavigationBar: NavigationBar(
//         selectedIndex: _pageCurrentIndex,
//         onDestinationSelected: destinationSelected,
//         destinations:const  [
//           NavigationDestination(icon:  Icon(Icons.list_rounded), label: "contacts list"),
//           NavigationDestination(icon:  Icon(Icons.group_add), label: "add group"),
//           NavigationDestination(icon:  Icon(Icons.add_call), label: "add contact"),
//         ],
//       )
//     );
//   }
//
//
// }
