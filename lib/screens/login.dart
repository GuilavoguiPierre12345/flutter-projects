import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:projet_application/database.dart';
import 'package:projet_application/screens/home.dart';
import 'package:dio/dio.dart' as dio;
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

class LoginPage extends StatefulWidget {

  AppDatabase databaseInstance;
  LoginPage({super.key, required this.databaseInstance});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void login({required Map credentials}) async {
    final dioClient = dio.Dio();

    ProgressDialog pd = ProgressDialog(context: context);

    try {
      pd.show(
        max: 100,
        msg: "Wait for checking your credentials ...",
      );

      dio.Response response = await dioClient
          .post("https://reqres.in/api/login", data: credentials);

      pd.close();

      if (response.statusCode == 200) {
        Get.off(() => HomePage(databaseInstance: widget.databaseInstance));
      }
    } catch (e) {
      Get.snackbar("Error", "Your credentials is incorrect",
          snackPosition: SnackPosition.BOTTOM);
      pd.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/flower.avif"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(.7),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "LOGIN",
                style: TextStyle(
                  fontSize: 29,
                ),
              ),
              FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FormBuilderTextField(
                        initialValue: "eve.holt@reqres.in",
                        autofocus: false,
                        name: 'email',
                        decoration: const InputDecoration(
                            label: Text('Email'),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                              errorText: "The email field is required"),
                          FormBuilderValidators.email(
                              errorText: "your email address is invalid !"),
                        ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FormBuilderTextField(
                        autofocus: false,
                        initialValue: "cityslicka",
                        name: 'password',
                        decoration: const InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                              errorText: "The password field is required"),
                        ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GFButton(
                        onPressed: () => {
                          if (_formKey.currentState!.saveAndValidate())
                            {login(credentials: _formKey.currentState!.value)}
                        },
                        color: GFColors.SUCCESS,
                        size: GFSize.LARGE,
                        fullWidthButton: true,
                        text: "Connexion",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GFButton(
                        onPressed: () => false,
                        color: GFColors.SUCCESS,
                        type: GFButtonType.outline,
                        size: GFSize.LARGE,
                        fullWidthButton: true,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Sign Up with Google"),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Image.asset("assets/images/google.png")
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
