import 'package:flutter/material.dart';

const String imagepath = "assets/images/";

Size getsize(context) => MediaQuery.of(context).size;
SizedBox addhorizentalspace(width) => SizedBox(
      width: width.toDouble(),
    );
SizedBox addverticalspace(height) => SizedBox(
      height: height.toDouble(),
    );
