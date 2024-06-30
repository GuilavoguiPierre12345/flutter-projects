import 'package:app_school/constantes.dart';
import 'package:flutter/material.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});
  static String routeName = "MyProfileScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        actions: [
          InkWell(
            onTap: () {
              //   send report to school management, in case if you want some changes to your profile
            },
            child: Container(
              padding: const EdgeInsets.only(right: kDefaultPadding / 2),
              child: Row(
                children: [
                  const Icon(
                    Icons.report_gmailerrorred_outlined,
                    color: kTextWhiteColor,
                  ),
                  halfWidthSizeBox,
                  Text("Report",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: kTextWhiteColor))
                ],
              ),
            ),
          )
        ],
      ),
      body: Container(
        color: kOtherColor,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150.0,
              decoration: const BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(kDefaultPadding * 2),
                  bottomRight: Radius.circular(kDefaultPadding * 2),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    minRadius: 60.0,
                    maxRadius: 60.0,
                    backgroundColor: kSecondaryColor,
                    backgroundImage: AssetImage("assets/images/profil.png"),
                  ),
                  widthSizeBox,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Yaboigui Foromo",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                  color: kTextWhiteColor)),
                      Text("Niveau Etude : 11 SM | ",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                  color: kTextWhiteColor)),
                    ],
                  ),

                ],
              ),
            ),
            sizeBox,
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: const [
                  Row(
                    children: [
                      ProfileDetailRow(title: "Registration Number", value: "2023-AQSX-2024"),
                      ProfileDetailRow(title: "Academy year", value: "2023-2024"),
                    ],
                  ),
                  Row(
                    children: [
                      ProfileDetailRow(title: "Academy Class", value: "11 SM"),
                      ProfileDetailRow(title: "Academy Number", value: "00012"),
                    ],
                  ),
                  Row(
                    children: [
                      ProfileDetailRow(title: "Date of Admission", value: "26 Sept 2023"),
                      ProfileDetailRow(title: "Date de Naissance", value: "01 Jan 2040"),
                    ],
                  ),
                  ProfileDetailColumn(title: "Email", value: "yaboigui@gmail.com"),
                  ProfileDetailColumn(title: "Father Name", value: "yaboigui guilavogui"),
                  ProfileDetailColumn(title: "Mother Name", value: "yaboigui guilavogui"),
                  ProfileDetailColumn(title: "Phone Number", value: "625-50-63-85"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProfileDetailRow extends StatelessWidget {
  const ProfileDetailRow({super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          right: kDefaultPadding / 10,
          left: kDefaultPadding / 10,
          top: kDefaultPadding / 2),
      width: MediaQuery.of(context).size.width / 2,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 18.0, fontWeight: FontWeight.w500),
              ),
              halfSizeBox,
              Text(
                value,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.w600, fontSize: 18.0),
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: const Divider(
                    thickness: 1.0,
                  )),
            ],
          ),
          const Icon(
            Icons.lock_outline,
            size: 18.0,
          ),
        ],
      ),
    );
  }
}

class ProfileDetailColumn extends StatelessWidget {
  const ProfileDetailColumn({super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: kDefaultPadding / 3 ,right: kDefaultPadding / 2),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: kContainerColor,
                      fontSize: 22.0
                  ),),
                  Text(value, style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: kTextBlackColor,
                      fontSize: 18.0
                  ),),
                ],
              ),
              const Icon(Icons.lock_outlined,size: 20.0,),

            ],

          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1,
            child: const Divider(thickness: 1.0,),
          ),
        ],
      ),
    );
  }
}

