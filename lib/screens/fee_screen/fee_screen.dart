import 'package:app_school/constantes.dart';
import 'package:flutter/material.dart';

import 'data/fee_data.dart';
import 'widgets/fee_widget.dart';

class FeeScreen extends StatelessWidget {
  const FeeScreen({super.key});

  static String routeName = "FeeScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fees"),
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
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(
                    left: kDefaultPadding, right: kDefaultPadding),
                itemCount: fee.length,
                itemBuilder: (context, i) {
                  return Container(
                    margin: const EdgeInsets.only(
                        top: kDefaultPadding, bottom: kDefaultPadding),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              left: kDefaultPadding / 2,
                              right: kDefaultPadding / 2),
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(kDefaultPadding),
                              ),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: kContainerColor, blurRadius: 2.0)
                              ]),
                          child: Column(
                            children: [
                              FeeDetailRow(
                                title: "Receive No",
                                statusValue: fee[i].receptionNo,
                              ),
                              const SizedBox(
                                height: kDefaultPadding,
                                child: Divider(
                                  thickness: 2.0,
                                ),
                              ),
                              FeeDetailRow(
                                title: "Month",
                                statusValue: fee[i].month,
                              ),
                              const SizedBox(
                                height: kDefaultPadding,
                              ),
                              FeeDetailRow(
                                title: "Payement Date",
                                statusValue: fee[i].date,
                              ),
                              const SizedBox(
                                height: kDefaultPadding,
                              ),
                              FeeDetailRow(
                                title: "Status",
                                statusValue: fee[i].payementStatus,
                              ),
                              const SizedBox(
                                height: kDefaultPadding,
                                child: Divider(
                                  thickness: 2.0,
                                ),
                              ),
                              FeeDetailRow(
                                title: "Total Amont",
                                statusValue: fee[i].totalAcount,
                              ),
                            ],
                          ),
                        ),
                        FeeButton(
                            title: fee[i].btnStatus,
                            iconData: Icons.arrow_forward,
                            onPress: () {}),
                      ],
                    ),
                  );
                }),
          ))
        ],
      ),
    );
  }
}

