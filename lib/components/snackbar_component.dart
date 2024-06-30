import 'package:app_school/components/alert_dialog_component.dart';
import 'package:app_school/constantes.dart';
import 'package:app_school/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

SnackBar snackBarComponent(BuildContext context){
  return  SnackBar(
    content: snackbarContent(context),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(
                kDefaultPadding * 2.5)
        )
    ),

    backgroundColor: kPrimaryColor,
    showCloseIcon: true,
    behavior: SnackBarBehavior.fixed,
    closeIconColor: kOtherColor,
    duration: const Duration(minutes: 1),
    dismissDirection: DismissDirection.vertical,
  );
}

// le contenu de la snackbar
Container snackbarContent(BuildContext context){
  return Container(
    height: 20.h,
    margin: const EdgeInsets.only(
      left: kDefaultPadding,
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "Enter your email adresse for received your password",
          style: TextStyle(fontSize: 20.0),
        ),
        const SizedBox(
          height: 10.0,
        ),
        TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return "the email field may not be empty";
            }
          },
          controller: LoginScreen.confirmationEmail,
          keyboardType: TextInputType.emailAddress,
          style: const TextStyle(color: kOtherColor, fontSize: 18.0),
          decoration: const InputDecoration(
              errorBorder: UnderlineInputBorder(),
              filled: true,
              hintText: "ex : pierreguilao96@gmail.com",
              hintStyle: TextStyle(color: kOtherColor)),
        ),
        ElevatedButton(
            onPressed: () {
              RegExp regex = RegExp(emailPattern);
              if (LoginScreen.confirmationEmail.text!.isEmpty || !regex.hasMatch(LoginScreen.confirmationEmail.text)) {
                showCustomDialog(scontext: context,
                    scontentMessage: "adresse email invalide",
                    sicon: Icons.error, siconColor: Colors.red, salertHauteur: 20.h);
              }else{
                showCustomDialog(scontext: context,
                    scontentMessage: "nous vous enverons un email sur ${LoginScreen.confirmationEmail.text}",
                    sicon: Icons.check, siconColor: Colors.green, salertHauteur: 15.h);
              }
            },
            child: const Text("Envoyer"))
      ],
    ),
  );
}


