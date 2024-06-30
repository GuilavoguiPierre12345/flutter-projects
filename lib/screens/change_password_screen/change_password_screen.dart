import 'package:app_school/constantes.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});
  static String routeName = "ChangePasswordScreen";

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool oldObscureText = true;
  bool newObscureText = true;
  bool confirmObscureText = true;

  late TextEditingController oldPassword;
  late TextEditingController newPassword;
  late TextEditingController newPasswordConfirm;

  // validation du fornulaire
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void oldPasswordVisibility() {
    setState(() {
      oldObscureText = !oldObscureText;
    });
  }

  void newPasswordVisibility() {
    setState(() {
      newObscureText = !newObscureText;
    });
  }

  void newPasswordVisibilityConfirm() {
    setState(() {
      confirmObscureText = !confirmObscureText;
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    oldObscureText = true;
    newObscureText = true;
    confirmObscureText = true;

    oldPassword = TextEditingController();
    newPassword = TextEditingController();
    newPasswordConfirm = TextEditingController();
  }

  @override
  void dispose(){
    // liberer les variables a la suppression
    oldPassword.dispose();
    newPassword.dispose();
    newPasswordConfirm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Change Your Password",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: kOtherColor, fontSize: 24.0),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
              width: 100.w,
              height: 25.h,
              child: Image.asset(
                "assets/images/changepassword.png",
                width: 100.w / 2,
                height: 25.h / 2,
              )),
          Expanded(
              child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(kDefaultPadding * 3)),
                color: kOtherColor),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        top: kDefaultPadding * 2,
                        left: kDefaultPadding,
                        right: kDefaultPadding),
                    child: TextFormField(
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.text,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: kTextBlackColor, fontSize: 20.0),
                      obscureText: oldObscureText,
                      decoration: InputDecoration(
                        filled: true,
                        suffixIcon: IconButton(
                            onPressed: oldPasswordVisibility,
                            icon: (oldObscureText)
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility)),
                        labelText: "your old password",
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                      controller: oldPassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please enter your password";
                        }
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        top: kDefaultPadding * 2,
                        left: kDefaultPadding,
                        right: kDefaultPadding),
                    child: TextFormField(
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.text,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: kTextBlackColor, fontSize: 20.0),
                      obscureText: newObscureText,
                      decoration: InputDecoration(
                        filled: true,
                        suffixIcon: IconButton(
                            onPressed: newPasswordVisibility,
                            icon: (newObscureText)
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility)),
                        labelText: "your new password",
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                      controller: newPassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please enter your new password";
                        }
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        top: kDefaultPadding * 2,
                        left: kDefaultPadding,
                        bottom: kDefaultPadding,
                        right: kDefaultPadding),
                    child: TextFormField(
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.text,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: kTextBlackColor, fontSize: 20.0),
                      obscureText: confirmObscureText,
                      decoration: InputDecoration(
                        filled: true,
                        suffixIcon: IconButton(
                            onPressed: newPasswordVisibilityConfirm,
                            icon: (confirmObscureText)
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility)),
                        labelText: "confirm new password",
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                      controller: newPasswordConfirm,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please enter a valid confirmation";
                        }
                        if(newPassword.text != newPasswordConfirm.text){
                          return "your confirm password is not correct";
                        }
                      },
                    ),
                  ),
                  Container(
                    height: 7.h,
                    padding: const EdgeInsets.only(
                        left: kDefaultPadding, right: kDefaultPadding),
                    child:
                        ElevatedButton(
                            onPressed: () {
                              if(_formKey.currentState!.validate()){

                              }
                            },
                            child: const Text("Engregistrer")),
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
