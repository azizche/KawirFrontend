import 'package:flutter/material.dart';

import 'package:kawir/common/theme.dart';
import 'package:kawir/common/usefulfunctions.dart';

import '../../../core/User.dart';

class ProfilePage extends StatelessWidget {
  User user;
  ProfilePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(user.name);
    return Scaffold(
        backgroundColor: backgroundcolor,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              addverticalspace(20),
              Text(
                'Profile Information',
                style: GeneralTheme.blackishtitle
                    .copyWith(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              addverticalspace(50),
              addinfo('First Name: ', user.name),
              addverticalspace(10),
              addinfo('Last Name: ', user.lastname),
              addverticalspace(10),
              addinfo('Email: ', user.email),
              addverticalspace(10),
              addinfo('Phone Number: ', user.phonenumber.toString()),
              addverticalspace(10),
            ],
          ),
        )));
  }
}

addinfo(string1, string2) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      addhorizentalspace(20),
      Text(
        string1,
        style: GeneralTheme.littlegreentext.copyWith(
          fontSize: 20,
          letterSpacing: -16 * 0.03,
        ),
      ),
      addhorizentalspace(5),
      Text(
        string2,
        style: GeneralTheme.blackishtitle.copyWith(
          fontSize: 20,
          letterSpacing: -16 * 0.03,
        ),
      ),
    ],
  );
}
