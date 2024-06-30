import 'package:flutter/material.dart';
import 'package:rss_app/models/articles.dart';
import 'package:intl/intl.dart';


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
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'FLUX RSS APP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //liste des articles
  List<Article> articles = [];
  bool httpComplete = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: (!httpComplete)
            ? showCircularProgress()
            : articles.isEmpty
                ? Center(child: Text("Article :${articles.length} actualiser la page svp"),)
                : list(),
        floatingActionButton: FloatingActionButton(
          onPressed: getFeed,
          child: const Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }


  Center showCircularProgress() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          Text("patientez svp")
        ],
      )
    );
  }
  Center simpleProgress() {
    return const Center(
      child: CircularProgressIndicator(),
      );
  }

  //convertir date
  String dateFormater(DateTime dateformat) {
    DateFormat dateFormat = DateFormat.yMd();
    final string = dateFormat.format(dateformat);
    return string;
  }

  ListView list() {
      return ListView.separated(
          itemBuilder: (ctx, index) {
            final width = MediaQuery.of(context).size.width;
            final height = MediaQuery.of(context).size.height;

            final currentArticle = articles[index];
            return InkWell(
              onTap: (){

              },
              child: Container(
                margin: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Spacer(),
                        Text(dateFormater(currentArticle.date)),
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(currentArticle.imageUrl,
                          fit: BoxFit.cover,
                          height: height / 3.5,
                          width: width,),
                    ),
                    Text(currentArticle.title),
                    const Divider(),
                    Text(currentArticle.description),
                  ],
                ),

              ),
            );
          },
          separatorBuilder: (ctx,index) => const Divider(),
          itemCount: articles.length
      );
  }

}
