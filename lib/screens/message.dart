import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:projet_application/database.dart';
import 'package:projet_application/models/user.dart';

class MessagePage extends StatefulWidget {

  MessagePage({super.key, required this.user, required this.databaseInstance});

  User user;
  AppDatabase databaseInstance;

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('${widget.user.firstName} ${widget.user.lastName} '),
          actions: [
            GestureDetector(
              onTap: () => {
                Get.defaultDialog(
                  title: "Alert message",
                  content: const Text("Diaolog Content",style: TextStyle(fontSize: 24),)
                )
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    image:
                        DecorationImage(image: NetworkImage(widget.user.image)),
                    borderRadius: const BorderRadius.all(Radius.circular(40)),
                    // color: Color(0xFFF2613F)
                  ),
                  // child:
                ),
              ),
            ),
          ]),
      body: Center(
        child: Text(widget.user.email),
      ),
    );
  }
}
