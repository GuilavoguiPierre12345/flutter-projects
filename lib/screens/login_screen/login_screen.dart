import 'package:app_school/components/custom_button.dart';
import 'package:app_school/components/snackbar_component.dart';
import 'package:app_school/constantes.dart';
import 'package:app_school/screens/home_screen/home_screen.dart';
import 'package:app_school/screens/register_screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String routeName = "LoginScreen";
  static TextEditingController confirmationEmail = TextEditingController();

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = true;

  // validation du fornulaire
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool switchValue = false;
  void onChangeSwitchValue(value) {
    setState(() {
      switchValue = value;
    });
  }

  void visibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    obscureText = true;
    switchValue = false;
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: ListView(
          children: [
            SizedBox(
              //   rendre toujours les tailles en fonctions des ecrans
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/splashimage.png",
                    width: 150.0,
                    height: 150.0,
                  ),
                  sizeBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Hi ",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w600, fontSize: 40.0),
                      ),
                      Text(" Student",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontSize: 40.0))
                    ],
                  ),
                  sizeBox,
                  Text(
                    "Sign in to continue",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(),
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  color: kTextWhiteColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(kDefaultPadding * 3),
                      topRight: Radius.circular(kDefaultPadding * 3))),
              child: Column(
                children: [
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: kDefaultPadding,
                          ),
                          buildPaddingSwitch(),
                          buildPaddingEmailOrNumber(context),
                          buildPaddingPasswordField(context),
                          sizeBox,
                          DefaultButton(
                            onPress: () {
                              if (_formKey.currentState!.validate()) {
                                //   navigation vers une autre page
                                Navigator.pushNamedAndRemoveUntil(context,
                                    HomeScreen.routeName, (route) => false);
                              }
                            },
                            title: "SIGN IN",
                            iconData: Icons.arrow_forward_outlined,
                          ),
                          sizeBox,
                          Container(
                            margin: const EdgeInsets.only(right: 10.0, left: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBarComponent(context));
                                    },
                                    child: const Text("Forgot Password ?",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          color: kPrimaryColor,
                                          fontSize: 20.0,
                                        )
                                    )
                                ),
                                TextButton(
                                    onPressed: () {
                                    //   go to register screen
                                      Navigator.pushNamed(context, RegisterScreen.routeName);
                                    },
                                    child: const Text("Create an acount",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          color: kPrimaryColor,
                                          fontSize: 20.0,
                                        )
                                    )
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildPaddingSwitch() {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("email "),
            Switch(
              value: switchValue,
              onChanged: onChangeSwitchValue,
              activeColor: kPrimaryColor,
              inactiveThumbColor: Colors.blue,
              inactiveTrackColor: Colors.blue,
            ),
            Text("number")
          ],
        ));
  }

  Padding buildPaddingEmailOrNumber(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        textAlign: TextAlign.start,
        keyboardType:
            !switchValue ? TextInputType.emailAddress : TextInputType.number,
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: kTextBlackColor, fontSize: 20.0),
        decoration: InputDecoration(
          labelText: !switchValue ? "email adresse" : "phone number",
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),
        validator: (value) {
          RegExp regex =
              !switchValue ? RegExp(emailPattern) : RegExp(phonePattern);
          if (value == null || value.isEmpty) {
            return !switchValue
                ? "please enter some text"
                : "please enter a phone number";
          } else if (!regex.hasMatch(value)) {
            return !switchValue
                ? "please enter a valid email adresse"
                : "please enter a valid phone number";
          }
        },
      ),
    );
  }

  Padding buildPaddingPasswordField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        textAlign: TextAlign.start,
        keyboardType: TextInputType.text,
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: kTextBlackColor, fontSize: 20.0),
        obscureText: obscureText,
        decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: visibility,
              icon: (obscureText)
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility)),
          labelText: "password",
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "please enter your password";
          }
        },
      ),
    );
  }
}
