import 'package:flutter/material.dart';
import 'package:telico_flutter/screens/login_page.dart';
import 'package:telico_flutter/utils/global_variables.dart';
import 'package:telico_flutter/widgets/appBar.dart';
import 'package:telico_flutter/widgets/buttonWidget.dart';
import 'package:telico_flutter/widgets/textInput.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nomCompletController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: customAppBar(title: "INSCRIVEZ-VOUS", isTitleCenter: true),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              customTextFormField(
                                  controller: nomCompletController,
                                  prefixIcon: Icons.person,
                                  hintText: "Nom complet"),
                              makeSpace(h: 10),
                              customTextFormField(
                                  controller: loginController,
                                  prefixIcon: Icons.person_outlined,
                                  hintText: "Identifiant"),
                              makeSpace(h: 10),
                              customTextFormField(
                                  controller: telephoneController,
                                  keyBoardType: true,
                                  prefixIcon: Icons.phone,
                                  hintText: "Telephone"),
                              makeSpace(h: 10),
                              customTextFormField(
                                  controller: emailController,
                                  prefixIcon: Icons.email,
                                  hintText: "Email"),
                              makeSpace(h: 10),
                              customTextFormField(
                                  controller: passwordController,
                                  prefixIcon: Icons.password,
                                  isTextObscured: true,
                                  hintText: "Mot de passe"),
                              makeSpace(h: 10),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.width / 5,
                                child: customButtonWidget(
                                    buttonText: "ENREGISTRER",
                                    color: themeColor),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: TextButton(
                                  child: const Text(
                                    "Vous avez un compte? Connectez-vous.",
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 16),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginPage()));
                                  },
                                ),
                              )
                            ],
                          ))
                    ],
                  )),
            )));
  }
}
