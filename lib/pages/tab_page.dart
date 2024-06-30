import 'package:easy_contact/pages/contactList_page.dart';
import 'package:flutter/material.dart';

class TabPage extends StatelessWidget {
  /* la liste des icons des tabs*/
  static List<Icon> icons = const [
    Icon(Icons.list_rounded),
    Icon(Icons.add_circle),
    Icon(Icons.group_add),
  ];
  // static List<String> tabTexts = ["list", "contact", "group"];

  /* la liste des tabs*/
  final List<Tab> tabs = icons.map((icon) => Tab(icon: icon,)).toList();

  /*une methode qui retourne les TabBar en fonction des tabs*/
  TabBar tabBar() => TabBar(tabs: tabs);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: icons.length,
        initialIndex: 0,
        child:Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text("Contact App Manager"),
              titleTextStyle:const TextStyle(color: Colors.green,fontSize: 28.0),
              bottom: tabBar(),
            ),
            body: TabBarView(
                physics: BouncingScrollPhysics(),
                children: [
                  /* appel des differentes pages ici */
                  ContactListPage(),
                  const Center(child: Text("Page 2"),),
                  const Center(child: Text("Page 3"),),
                ],
            ),
        )
    );
  }
}