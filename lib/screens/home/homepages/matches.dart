import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kawir/common/theme.dart';
import 'package:kawir/common/usefulfunctions.dart';
import 'package:kawir/core/Field.dart';
import 'package:kawir/core/User.dart';
import 'package:kawir/core/match.dart';
import 'package:kawir/screens/home/components/matchitem.dart';

class MatchsPage extends StatelessWidget {
  const MatchsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Field greenfield = Field(
        name: 'green field',
        ownerPhonenumber: 2222222,
        price: 2,
        capacity: 3,
        location: 'tunis',
        durationInMinutes: 2);
    Matche test = Matche(
        field: greenfield, start: DateTime.now(), finish: DateTime.now());
    User salah = User(
        name: 'salah',
        lastname: 'salag',
        email: 'salah',
        phonenumber: 222222,
        matches: [test, test, test]);
    List<Matche> teste = [test, test, test];
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              addverticalspace(20),
              Text(
                'Upcoming matches',
                style: GeneralTheme.blackishtitle
                    .copyWith(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              addverticalspace(20),
              Row(
                children: [
                  SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                          children:
                              teste.map((e) => MatchItem(match: e)).toList())),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
