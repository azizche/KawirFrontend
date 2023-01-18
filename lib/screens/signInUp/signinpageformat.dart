import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kawir/common/theme.dart';
import 'package:kawir/common/usefulfunctions.dart';
import 'package:kawir/screens/signInUp/components/textformsign.dart';

class GeneralSignPage extends StatelessWidget {
  final GlobalKey<FormState> formkey;
  final List<Widget> content;
  final String title;
  final bool showbackbutton;
  const GeneralSignPage(
      {super.key,
      required this.content,
      required this.title,
      required this.showbackbutton,
      required this.formkey});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: SafeArea(
        child: ListView(
          children: [
            showbackbutton
                ? Padding(
                    padding: EdgeInsets.only(top: 15, left: 20),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            padding: EdgeInsets.only(
                                top: 3, bottom: 3, left: 13, right: 5),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: maingreenColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : addverticalspace(55),
            Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  addverticalspace(50),
                  Image.asset(
                    imagepath + 'logo.png',
                    height: 80,
                    width: 80,
                  ),
                  addverticalspace(10),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: GeneralTheme.blackishtitle,
                  ),
                  for (int i = 0; i < content.length; i++) content[i],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
