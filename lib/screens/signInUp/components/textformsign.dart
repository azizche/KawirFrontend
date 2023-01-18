import 'package:flutter/material.dart';
import 'package:kawir/common/theme.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.color,
    required this.prefixpadding,
    required this.icon,
    this.ispassword = false,
    required this.hintText,
    required this.controller,
  }) : super(key: key);
  final TextEditingController controller;
  final Color color;
  final EdgeInsets prefixpadding;
  final Widget icon;
  final bool ispassword;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      height: 56,
      child: TextFormField(
        validator: (value) {
          if (value == null) {
            return 'Fill in this form please';
          }

          switch (hintText) {
            case 'Email':
              final RegExp regex = new RegExp(
                  r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
              if (!regex.hasMatch(value)) {
                return 'Enter a valid Email';
              }
              break;
            case 'Password':
              if (value.length < 8) {
                return 'The password needs to have at least 8 charcters';
              }
              break;
            case 'Phone Number':
              final RegExp regex = new RegExp(r"^[0-9]+$");
              if (!regex.hasMatch(value) && value.length != 8) {
                return 'Enter a valid Phone Number';
              }
              break;

            default:
              if (value.isEmpty) return 'Fill in this form please';
          }
          return null;
        },
        controller: controller,
        obscureText: hintText == 'Password',
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          hintText: hintText,
          hintStyle: GeneralTheme.disabledText,
          fillColor: color,
          suffixIcon: Padding(
              padding: EdgeInsets.only(
                right: 20,
                top: 18,
              ),
              child: ispassword
                  ? Text(
                      'Show',
                      style: TextStyle(
                        fontSize: 14,
                        height: 16 / 14,
                        color: Colors.black,
                        letterSpacing: -0.03,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                      ),
                    )
                  : SizedBox()),
          prefixIcon: Container(
            width: 60,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 17, right: 17),
                  child: Container(
                    child: icon,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
