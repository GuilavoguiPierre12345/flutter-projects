import 'package:flutter/material.dart';
import 'package:provider_app/widgets/pages/color_page.dart';
import 'package:provider_app/widgets/pages/counter_page.dart';
import 'package:provider_app/widgets/pages/toDo_page.dart';

class TabPage extends StatelessWidget {

  static List<Icon> icons = const [
    Icon(Icons.numbers),
    Icon(Icons.palette),
    Icon(Icons.list),
  ];

  List<Tab> tabs = icons.map((icon) => Tab(icon: icon,)).toList();
  TabBar tabBar() => TabBar(tabs: tabs);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: icons.length,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Apprendre les providers"),
            centerTitle: true,
            bottom: tabBar(),
          ),
          body:  TabBarView(
              physics: const BouncingScrollPhysics(),
              children: [
                const CounterPage(),
                ColorPage(),
                ToDoPage(),
              ],
          ),
        )
    );
  }
}