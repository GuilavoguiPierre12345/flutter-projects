import 'package:flutter/material.dart';
import 'package:quiz_pop_up/data.dart';
import 'package:quiz_pop_up/questions.dart';

class QuizzPage extends StatefulWidget {
  const QuizzPage({super.key});

  @override
  State<QuizzPage> createState() => QuizzPageState();
}

class QuizzPageState extends State<QuizzPage> {
  List<Question> questions = Datas().listeQuestions; // la liste des questions
  int index = 0; // l'index de la question dans la liste des questions
  int score = 0; // le score du joueur 

  @override
  Widget build(BuildContext context) {
    final Question currentQuestion = questions[index]; //la question courante
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("votre score : $score"),
        ),
        body: Center(
          child: Card(
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Question numero : ${index+1} / ${questions.length} ",
                    style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
                    Text(currentQuestion.question,
                        style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w400)),
                    Image.asset(currentQuestion.getImage()),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        answerBtn(false),
                        const SizedBox(width: 10.0,),
                        answerBtn(true)
                      ],
                    )
                  ],
              ),
            ),
          )
        ),
      ),
    );
  }

  // elevatedButton
  OutlinedButton answerBtn(bool b) {
    return OutlinedButton.icon(
        onPressed: (){
          checkAnswer(b);
        },
        icon: Icon((b)? Icons.check : Icons.close,color:b?Colors.greenAccent:Colors.redAccent ,),
        label: Text((b) ? "VRAI" : "FAUX",style: const TextStyle(color: Colors.black),),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: b?Colors.greenAccent:Colors.redAccent,width: 2.0)
        ),
    );
  }

  checkAnswer(bool answer){
    final question = questions[index];
    bool bonneReponse = (question.reponse == answer);
    if (bonneReponse) {
      setState(() {
        score++;
      });
    }
    //afficher la bonne reponse en modal
    showAnswer(bonneReponse);
  }

  //afficher la reponse a la question
  Future<void> showAnswer(bool bonneResponse) async {
    Question question = questions[index];
    String title = (bonneResponse) ? "C'est gagné" : "Raté !";
    String imgToShow = (bonneResponse) ? "vrai.jpg" : "faux.jpg";
    String path = "images/$imgToShow";
    return await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context){
          return SimpleDialog(
            title: Text(title,style: const TextStyle(fontSize: 24,),),
            children: [
              Image.asset(path),
              const SizedBox(height: 6.0,),
              Text(question.explication,textAlign: TextAlign.center,),
              TextButton(
                  onPressed: (){
                      Navigator.of(context).pop();
                      nextQuestion();
                  },
                  child:const Text("Passer à la question suivante")
              )
            ],
          );
    });
  }

  //montrer le resultat a la fin du jeu
  Future<void> showResultat() async {
    return await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext ctx){
          return AlertDialog(
            title: const Text("Fin de la partie",
              style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700,color: Colors.green),),
              content: Text("Votre score est : $score"),
              actions: [
                OutlinedButton(
                    onPressed: (){
                      Navigator.of(context).pop(ctx);
                      Navigator.of(context).pop(context);
                    },
                    child: const Text("OK")
                ),
              ],
          );
        }
    );
  }

  void nextQuestion(){
    if (index < questions.length-1) {
      setState(() {
        index++;
      });
    } else {
        showResultat();
    }
  }
}
