import 'package:flutter/material.dart';

class FeeData {
  final String receptionNo;
  final String month;
  final String date;
  final String payementStatus;
  final String totalAcount;
  final String btnStatus;

  FeeData(
      {required this.receptionNo,
      required this.month,
      required this.date,
      required this.payementStatus,
      required this.totalAcount,
      required this.btnStatus});
}

List<FeeData> fee = [
  FeeData(
      receptionNo: "90218",
      month: "September",
      date: "26 Sept",
      payementStatus: "Pending",
      totalAcount: "GNF 8,500",
      btnStatus: "PAY NOW"),
  FeeData(
      receptionNo: "23018",
      month: "November",
      date: "20 Nov",
      payementStatus: "Paid",
      totalAcount: "GNF 2,500",
      btnStatus: "DOWNLOAD"),
  FeeData(
      receptionNo: "36118",
      month: "December",
      date: "02 Dec",
      payementStatus: "Paid",
      totalAcount: "GNF 7,100",
      btnStatus: "DOWNLOAD"),
];
