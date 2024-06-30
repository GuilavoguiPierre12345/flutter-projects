import 'package:flutter/material.dart';
import 'package:quiz_pop_up/quizz_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Quizz flutter"),centerTitle: true,),
        body: Center(
          child: Card(
            color: Colors.deepOrange.shade200,
            elevation: 30,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset("images/cover.jpg",width: width * 0.85 , height: height / 2.0 , fit: BoxFit.cover,)),
                ElevatedButton.icon(
                    onPressed: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context){
                          return const QuizzPage();
                        })
                      );
                    },
                    label: const Text("Commencez le Quizz"),
                    icon: const Icon(Icons.arrow_circle_right_outlined),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
