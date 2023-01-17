import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:kawir/common/theme.dart';
import 'package:kawir/core/User.dart';
import 'package:kawir/screens/home/homepages/matches.dart';
import 'package:kawir/screens/home/homepages/profile.dart';

import 'homepages/field.dart';

class HomePage extends StatefulWidget {
  User user;
  HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentindex = 0;
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: PageView(
          controller: controller,
          onPageChanged: (value) {
            currentindex = value;
          },
          children: [
            MatchsPage(),
            FieldsPage(),
            ProfilePage(),
          ]),
      bottomNavigationBar: BottomNavigationBar(
          iconSize: 30,
          selectedItemColor: maingreenColor,
          unselectedItemColor: maintextColor.withOpacity(0.5),
          selectedFontSize: 11,
          unselectedFontSize: 11,
          currentIndex: currentindex,
          onTap: (value) {
            currentindex = value;
            controller.animateToPage(currentindex,
                duration: Duration(milliseconds: 500), curve: Curves.easeIn);

            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.grid_on), label: 'Fields'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: 'Profile'),
          ]),
    );
  }
}
