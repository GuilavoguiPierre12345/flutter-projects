import 'package:flutter/material.dart';
import 'package:liste_grille_app/gridview.dart';
import 'package:liste_grille_app/liste.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
        useMaterial3: false,
      ),
      home: const HomePage(title: 'Places pour recreation'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool cardColor = false;
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Places pour recreation"),
        ),
        body: (orientation == Orientation.portrait)
            ? Liste().buildListeView()
            : Grid().buildGridView()
        /*ListView.separated(
            itemCount: courses.length,
            separatorBuilder: (ctx,index){
              return const Divider();
            },
            itemBuilder: (ctx,index){
              final currentCourseItem = courses[index];
              return elementToShow(currentCourseItem,index);
            },
        )*/
      ),
    );
  }

}

