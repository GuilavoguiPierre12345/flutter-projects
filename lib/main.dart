import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/providers/color_provider.dart';
import 'package:provider_app/providers/count_provider.dart';
import 'package:provider_app/providers/todo_provider.dart';
import 'package:provider_app/widgets/pages/tab_page.dart';

void main() {
  runApp(
    /*Provider(create: (_) =>ProviderName : dans le cas d'utilisation d'un seule provider*/
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CountProvider()),
          ChangeNotifierProvider(create: (_) => ColorProvider()),
          ChangeNotifierProvider(create: (_) => ToDoProvider()),
        ],
        child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final colorProvider = Provider.of<ColorProvider>(context);
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Provider',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: colorProvider.color),
          useMaterial3: false,
        ),
        home: TabPage(),
      ),
    );
  }
}


