import 'package:flutter/material.dart';
import 'package:kawir/common/theme.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    Key? key,
    required this.text,
    required this.sidepadding,
    this.color = maingreenColor,
  }) : super(key: key);
  final sidepadding;
  final String text;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: sidepadding),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GeneralTheme.buttonText,
      ),
    );
  }
}
