import 'dart:io';

import 'package:app_school/components/custom_button.dart';
import 'package:app_school/constantes.dart';
import 'package:app_school/screens/home_screen/home_screen.dart';
import 'package:app_school/screens/register_screen/textform_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static String routeName = "RegisterScreen";
  
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool obscureText = true;

  // validation du fornulaire
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController prenom = TextEditingController();
  TextEditingController nom = TextEditingController();
  TextEditingController telephone = TextEditingController();
  TextEditingController password = TextEditingController();
  String genre = "M";
  int age = 7;

  Map<String,dynamic>? newUserInfos;

  double sliderValue = 7.0;
  void onChangeSliderValue(value) {
    setState(() {
      sliderValue = value;
      age = sliderValue.toInt();
    });
  }

  bool switchValue = false;
  void onChangeSwitchValue(value) {
    setState(() {
      switchValue = value;
      genre = switchValue ? "F" : "M";
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
    prenom = TextEditingController();
    obscureText = true;
    switchValue = false;
  }

  @override
  void dispose() {
    prenom.dispose();
    super.dispose();
  }
  // le selectionneur d'image
  ImagePicker imagePicker = ImagePicker();
  File? file; // la variable de type fichier, c'est cette variable qui contiendra l'image


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: ListView(
          physics: BouncingScrollPhysics(),
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
                    "assets/images/registerimage.png",
                    width: 100.w,
                    height: 30.h,
                  ),
                  sizeBox,
                  Text(
                    "Creer un compte",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 28.0),
                  )
                ],
              ),
            ),
            Container(
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
                          Stack(
                            children: [
                              Container(
                                width :45.w,
                                height: 20.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.0),
                                  color: Colors.blue
                                ),
                                child: (file != null)
                                    ? Image.file(file!,fit: BoxFit.cover,)
                                    : Image.asset("assets/images/adduser.png",width: 20.w,height: 10.h,),
                              ),
                              IconButton(
                                  onPressed: () => useCamera(ImageSource.gallery),
                                  icon: const Icon(
                                    Icons.camera_enhance_rounded,
                                    color: Colors.red,
                                    size: 50,
                                  ))
                            ],
                          ),
                          textFormField(
                              inputType: TextInputType.text,
                              onPress: () {
                                setState(() {
                                  prenom.text = "";
                                });
                              },
                              context: context,
                              htext: 'ex: Foromo Yaboigui',
                              ltext: "Prenom",
                              sicon: Icons.clear,
                              controllervalue: prenom),
                          textFormField(
                              inputType: TextInputType.text,
                              onPress: () {
                                setState(() {
                                  nom.text = "";
                                });
                              },
                              context: context,
                              htext: 'ex: Guilavogui',
                              ltext: "Nom",
                              sicon: Icons.clear,
                              controllervalue: nom),
                          textFormField(
                              inputType: TextInputType.number,
                              onPress: () {
                                setState(() {
                                  telephone.text = "";
                                });
                              },
                              context: context,
                              htext: 'ex: 625506385',
                              ltext: "Telephone",
                              sicon: Icons.clear,
                              controllervalue: telephone),
                          textFormField(
                              obscureText: obscureText,
                              inputType: TextInputType.text,
                              onPress: () {
                                setState(() {
                                  obscureText = !obscureText;
                                });
                              },
                              context: context,
                              htext: 'ex: *************',
                              ltext: "Mot de passe",
                              sicon: obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              controllervalue: password),
                          const Text(
                            "Genre",
                            textAlign: TextAlign.center,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildPaddingSwitch(),
                            ],
                          ),
                          buildPaddingSlider(),
                          DefaultButton(
                            onPress: () {
                              if (_formKey.currentState!.validate()) {
                                newUserInfos = {
                                  "prenom" : prenom.text,
                                  "nom" : nom.text,
                                  "password" : password.text,
                                  "telephone" : telephone.text,
                                  "age" : age,
                                  "genre" : genre,
                                };

                                //   navigation vers une autre page
                                Navigator.pushNamedAndRemoveUntil(context,
                                    HomeScreen.routeName, (route) => false,arguments: newUserInfos);
                              }
                            },
                            title: "S'Inscrire",
                            iconData: Icons.arrow_forward_outlined,
                          ),
                          sizeBox,
                          Container(
                            margin:
                                const EdgeInsets.only(right: 10.0, left: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      //   go to register screen
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("Register",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          color: kPrimaryColor,
                                          fontSize: 20.0,
                                        ))),
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
            Row(
              children: [
                const Text("H"),
                IconButton(onPressed: () {}, icon: const Icon(Icons.male)),
              ],
            ),
            Switch(
              value: switchValue,
              onChanged: onChangeSwitchValue,
              activeColor: kPrimaryColor,
              inactiveThumbColor: Colors.blue,
              inactiveTrackColor: Colors.blue,
            ),
            Row(
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.female)),
                const Text("F"),
              ],
            ),
          ],
        ));
  }

  Padding buildPaddingSlider() {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text("Age : "),
            Slider(
              value: sliderValue,
              onChanged: onChangeSliderValue,
              max: 100,
              min: 7,
              activeColor: kPrimaryColor,
              inactiveColor: Colors.grey,
            ),
            Text((sliderValue.toInt()).toString()),
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

  Future useCamera(ImageSource source) async {
    XFile? xFile = await imagePicker.pickImage(source: source);
    if(xFile != null){
    //   si une image est choisi alors on recupere sont chemin
      setState(() {
        file = File(xFile!.path);
      });
    }
  }
}
