import 'package:app_school/components/result_component.dart';
import 'package:app_school/constantes.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'data/result_screen_data.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});
  static String routeName = "ResultScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("Results")),
      body: Column(
        children: [
          Container(
            child: Container(
              height: 20.h,
              margin: EdgeInsets.all(3.h),
              child: CustomPaint(
                foregroundPainter:CircularPainter(
                    backgroundColor:kOtherColor,
                    lineColor:kOtherColor,width:5.w
                ),
                child: Container(padding:EdgeInsets.only(top: 50), child: Text("550 / 700",style: TextStyle(color: kOtherColor,fontSize: 30.0))),
              ),
            ),
          ),
          Text(
            "You are excellent",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.w900, color: kTextWhiteColor),
          ),
          Text(
            "Yaboigui",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w900,
                  color: kTextWhiteColor,
                  fontSize: 10.w,
                ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(right: kDefaultPadding / 2,left: kDefaultPadding / 2),
              decoration: BoxDecoration(
                color: kOtherColor,
                borderRadius: BorderRadius.circular(kDefaultPadding),
              ),
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: result.length,
                  itemBuilder: (context, i) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: kDefaultPadding/3,top: kDefaultPadding/3),
                      padding: const EdgeInsets.only(bottom: kDefaultPadding,right: kDefaultPadding,left: kDefaultPadding),
                      decoration:  BoxDecoration(color: kPrimaryColor,borderRadius: BorderRadius.circular(kDefaultPadding)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                result[i].subjectName,
                                textAlign: TextAlign.start,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(color: kOtherColor),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${result[i].obtainedMarks} / ${result[i].totalMarks}",
                                    textAlign: TextAlign.start,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(color: kOtherColor),
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        width: result[i].totalMarks.toDouble(),
                                        height: 2.h,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[700],
                                          borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(kDefaultPadding),
                                            topLeft: Radius.circular(kDefaultPadding),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 2.h,
                                        width: result[i].obtainedMarks.toDouble(),
                                        decoration: BoxDecoration(
                                          color: result[i].grade =="D"? kErrorBorderColor :kOtherColor,
                                          borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(kDefaultPadding),
                                            topLeft: Radius.circular(kDefaultPadding),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Text(result[i].grade,style: const TextStyle(fontWeight: FontWeight.w800,color: kOtherColor),)
                                ],
                              ),

                            ],
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
