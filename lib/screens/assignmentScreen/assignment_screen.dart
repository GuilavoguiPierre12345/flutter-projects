import 'package:app_school/constantes.dart';
import 'package:flutter/material.dart';

import 'data/assignment_data.dart';
import 'widgets/assignment_widget.dart';

class AssignmentScreen extends StatelessWidget {
  const AssignmentScreen({super.key});
  static String routeName = "AssignmentScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Assignments"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            decoration: const BoxDecoration(
                color: kOtherColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(kDefaultPadding),
                  topLeft: Radius.circular(kDefaultPadding),
                )),
            child: ListView.builder(
              padding:const EdgeInsets.all(kDefaultPadding),
              physics: const BouncingScrollPhysics(),
              itemCount: assignment.length,
              itemBuilder: (context, i) {
                return Container(
                  child: Column(
                    children: [
                      Container(
                        padding:const EdgeInsets.all(kDefaultPadding),
                        margin:const EdgeInsets.only(bottom: kDefaultPadding),

                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(kDefaultPadding),
                            color: kOtherColor,
                            boxShadow:const [BoxShadow(color: kContainerColor,blurRadius: 2.0)]
                            ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 200.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(kDefaultPadding),
                                  color: kSecondaryColor.withOpacity(0.5),
                              ),

                              child: Center(
                                child: Text(
                                  assignment[i].subjectName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 24.0,
                                      color: kPrimaryColor),
                                ),
                              ),
                            ),
                            halfSizeBox,
                            Text(
                              assignment[i].topicName,
                              style: const TextStyle(
                                  color: kTextBlackColor,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500),
                            ),
                            halfSizeBox,
                            AssignmentDetailRow(
                              title: "Assignment Date",
                              statusValue: assignment[i].assignDate,
                            ),
                            halfSizeBox,
                            AssignmentDetailRow(
                              title: "Last Date",
                              statusValue: assignment[i].assignDate,
                            ),
                            halfSizeBox,
                            AssignmentDetailRow(
                              title: "Status",
                              statusValue: assignment[i].status,
                            ),
                            halfSizeBox,
                            if (assignment[i].status == "Pending")
                              AssignmentButton(
                                title: "To be Submitted",
                                onPress: () {},
                              ),
                              halfSizeBox,

                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ))
        ],
      ),
    );
  }
}

