import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telico_flutter/screens/register_page.dart';
import 'package:telico_flutter/utils/global_variables.dart';
import 'package:telico_flutter/widgets/appBar.dart';
import 'package:telico_flutter/widgets/buttonWidget.dart';
import 'package:telico_flutter/widgets/customModalWidget.dart';
import 'package:telico_flutter/widgets/textInput.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar(title: "IDENTIFIEZ-VOUS", isTitleCenter: true),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(top: 60.0, left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                      color: themeColor,
                      borderRadius: BorderRadius.all(Radius.circular(140))),
                  child: Image.asset(
                    width: 220,
                    height: 220,
                    "assets/images/uservert.png",
                  ),
                ),
                makeSpace(h: 20),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        customTextFormField(
                            controller: loginController,
                            prefixIcon: Icons.person,
                            hintText: "Identifiant"),
                        makeSpace(h: 10),
                        customTextFormField(
                            controller: passwordController,
                            prefixIcon: Icons.lock_open_sharp,
                            isTextObscured: true,
                            hintText: "Mot de passe"),
                        Container(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                            child: const Text(
                              "Mot de passe oublie ?",
                              style: TextStyle(color: Colors.red, fontSize: 20),
                            ),
                            onPressed: () async {
                              showDialog(
                                  barrierDismissible: false,
                                  barrierColor: Colors.black.withOpacity(.85),
                                  context: context,
                                  builder: (context) =>
                                      customModalDialog(context: context));
                            },
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width / 5,
                          child: customButtonWidget(
                              buttonText: "CONNEXION", color: themeColor),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: TextButton(
                            child: const Text(
                              "Vous n’avez pas de compte? Créez-en",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 16),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterPage()));
                            },
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
