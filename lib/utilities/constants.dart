import 'package:flutter/material.dart';

const kHeadingStyle = TextStyle(
  fontSize: 26,
  fontWeight: FontWeight.bold,
);

const kBottomContainerTextStyle = TextStyle(
  fontSize: 26,
  fontWeight: FontWeight.bold,
);

const kTempStyle = TextStyle(
  fontSize: 80,
  fontWeight: FontWeight.bold,
);

const kTempFeedbackStyle = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.bold,
);

const kLocationStyle = TextStyle(
  color: Colors.white,
  fontSize: 18,
);

const kInputFieldDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  prefixIcon: Icon(
    Icons.search,
    color: Colors.black,
    size: 30,
  ),
  hintText: "Enter City Name",
  hintStyle: TextStyle(color: Colors.grey),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
    borderSide: BorderSide.none,
  ),
);
