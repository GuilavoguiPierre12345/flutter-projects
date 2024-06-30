import 'package:flutter/material.dart';

//colors
const Color kPrimaryColor = Color(0xFF345FB4);
const Color kSecondaryColor = Color(0xFF6789CA);
const Color kTextBlackColor = Color(0xFF313131);
const Color kTextWhiteColor = Color(0xFFFFFFFF);
const Color kContainerColor = Color(0xFF777777);
const Color kOtherColor = Color(0xFFF4F6F7);
const Color kErrorBorderColor = Color(0xFFE74C3C);

const sizeBox = SizedBox(height: kDefaultPadding,);
const widthSizeBox = SizedBox(width: kDefaultPadding,);
const halfSizeBox = SizedBox(
  height: kDefaultPadding / 2,
);
const halfWidthSizeBox = SizedBox(
  width: kDefaultPadding / 2,
);
//default value
const kDefaultPadding = 20.0;

//validation for mobile

//email Adresse pattern
const String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
const String phonePattern = r'^6[1256]\d{7}$';
