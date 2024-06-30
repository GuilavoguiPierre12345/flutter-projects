import 'package:app_school/constantes.dart';
import 'package:flutter/material.dart';

import 'data/datasheet_data.dart';

class DataSheetScreen extends StatelessWidget {
  const DataSheetScreen({super.key});

  static String routeName = "DataSheetScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DataSheets"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration:const BoxDecoration(
                color: kOtherColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(kDefaultPadding),
                  topLeft: Radius.circular(kDefaultPadding),
                )
              ),
              child: ListView.builder(
                physics:const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(left: kDefaultPadding / 2,right: kDefaultPadding),
                itemCount: datasheet.length,
                itemBuilder: (context,i){
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width / 4,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: kDefaultPadding,
                          child: Divider(thickness: 2.0,),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(datasheet[i].date.toString(),style:const TextStyle(color: kTextBlackColor,
                                fontSize: 26.0,fontWeight: FontWeight.bold),),

                                Text(datasheet[i].monthName,style:const TextStyle(color: kTextBlackColor,
                                fontSize: 16.0,fontWeight: FontWeight.w300),),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(datasheet[i].subjectName,style:const TextStyle(color: kTextBlackColor,
                                fontSize: 26.0,fontWeight: FontWeight.bold),),

                                Text(datasheet[i].dayName,style:const TextStyle(color: kTextBlackColor,
                                fontSize: 16.0,fontWeight: FontWeight.w300),),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(Icons.access_alarm_outlined),
                                Text(datasheet[i].time,style:const TextStyle(color: kTextBlackColor,
                                fontSize: 16.0,fontWeight: FontWeight.w300),),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),

                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

