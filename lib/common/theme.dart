import 'package:flutter/material.dart';

const Color maingreenColor = Color(0xFF4ECF84);
const Color backgroundcolor = Color(0xFFE8E8E8);
const Color maintextColor = Color(0xFF595959);

class GeneralTheme {
  static TextStyle greentitle = TextStyle(
    fontFamily: 'SF Display',
    fontSize: 40,
    fontWeight: FontWeight.w700,
    color: maingreenColor,
  );
  static TextStyle blackishtitle = TextStyle(
    fontFamily: 'SF Display',
    fontSize: 27,
    fontWeight: FontWeight.w700,
    color: maintextColor,
  );
  static TextStyle disabledText = TextStyle(
    fontFamily: 'SF Display',
    fontWeight: FontWeight.w500,
    fontSize: 16,
    letterSpacing: -16 * 0.03,
    color: maintextColor.withOpacity(0.5),
  );
  static TextStyle littlegreentext = TextStyle(
    fontFamily: 'SF Display',
    fontWeight: FontWeight.bold,
    fontSize: 12,
    letterSpacing: -16 * 0.03,
    color: maingreenColor,
  );
  static TextStyle buttonText = TextStyle(
    fontFamily: 'SF Display',
    fontWeight: FontWeight.bold,
    fontSize: 17,
    color: Colors.white,
  );
}
