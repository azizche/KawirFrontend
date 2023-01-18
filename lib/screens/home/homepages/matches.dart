import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'package:kawir/common/theme.dart';
import 'package:kawir/common/usefulfunctions.dart';
import 'package:kawir/core/Field.dart';
import 'package:kawir/core/User.dart';
import 'package:kawir/core/match.dart';
import 'package:kawir/screens/home/components/matchitem.dart';

class MatchsPage extends StatelessWidget {
  User user;
  MatchsPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: FutureBuilder<Response>(
          future: http.get(
            Uri.parse('http://10.0.2.2:3000/match/user/${user.id}'),
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text('WAITING ....');
            } else {
              List<Matche> matches = [];

              if (!snapshot.hasData) {
                print('hiiiii');
              } else {
                print(user.id);
                print(snapshot.data!.body);
                List dataa = json.decode(snapshot.data!.body);
                for (int i = 0; i < dataa.length; i++) {
                  Field fielddd = Field(
                    id: dataa[i]['field']['id'].toString(),
                    name: dataa[i]['field']['name'],
                    ownerPhonenumber:
                        int.parse(dataa[i]['field']['ownerphonenumber']),
                    price: (dataa[i]['field']['price'] as int).toDouble(),
                    durationInMinutes: dataa[i]['field']['duratingInMinutes'],
                    location: dataa[i]['field']['location'],
                    capacity: dataa[i]['field']['capacity'],
                  );
                  Matche matchhh = Matche(
                      id: dataa[i]['id'].toString(),
                      field: fielddd,
                      start: DateTime.parse(dataa[i]['start']),
                      finish: DateTime.parse(dataa[i]['finish']));
                  matches.add(matchhh);
                }
              }

              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView(
                    children: [
                      addverticalspace(20),
                      Text(
                        'Upcoming matches',
                        style: GeneralTheme.blackishtitle.copyWith(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      addverticalspace(20),
                      Row(
                        children: [
                          SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                  children: matches
                                      .map((e) => MatchItem(
                                            match: e,
                                            user: user,
                                          ))
                                      .toList())),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
          }),
    );
  }
}
