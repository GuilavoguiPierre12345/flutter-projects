import 'package:flutter/material.dart';
import 'package:telico_flutter/screens/account_page.dart';
import 'package:telico_flutter/screens/accueil_page.dart';
import 'package:telico_flutter/screens/groupe_page.dart';
import 'package:telico_flutter/utils/global_variables.dart';
import 'package:telico_flutter/widgets/appBar.dart';
import 'package:telico_flutter/widgets/customDrawer.dart';
import 'package:telico_flutter/widgets/customExpansionTile.dart';
import 'package:telico_flutter/widgets/customNavBar.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    void changePageIndex(int index) {
      setState(() {
        currentIndex = index;
      });

      print(currentIndex);
    }
    List pageList = <Widget>[
      AccueilPage(context), GroupePage(), AccountPage()];


    return SafeArea(
        child: Scaffold(
      appBar: customAppBar(title: "CONTACTS", isTitleCenter: true),
      drawer: customDrawer(context),
      body: pageList[currentIndex],
      bottomNavigationBar: customNavBar(
        context: context,
        currentIndex: currentIndex,
        changePageIndex: changePageIndex,
        setState: setState,
      ),
    ));
  }
}
