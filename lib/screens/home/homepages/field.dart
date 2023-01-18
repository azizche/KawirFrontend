import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import 'package:kawir/common/theme.dart';
import 'package:kawir/common/usefulfunctions.dart';
import 'package:kawir/core/Field.dart';
import 'package:kawir/screens/home/components/fielditem.dart';
import 'package:kawir/screens/home/components/matchitem.dart';

import '../../../core/User.dart';

class FieldsPage extends StatelessWidget {
  User user;
  FieldsPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Field greenfield = Field(
        id: '2',
        name: 'green field',
        ownerPhonenumber: 2222222,
        price: 2,
        capacity: 3,
        location: 'tunis',
        durationInMinutes: 2);
    final teste = [greenfield, greenfield, greenfield];
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: FutureBuilder<Response>(
              future: http.get(
                Uri.parse('http://10.0.2.2:3000/field'),
              ),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Text('WAITING ....');
                } else {
                  List<Field> fields = [];
                  print(snapshot.data!.body);
                  List dataa = json.decode(snapshot.data!.body);
                  for (int i = 0; i < dataa.length; i++) {
                    Field fielddd = Field(
                      id: dataa[i]['id'].toString(),
                      name: dataa[i]['name'],
                      ownerPhonenumber: int.parse(dataa[i]['ownerphonenumber']),
                      price: (dataa[i]['price'] as int).toDouble(),
                      durationInMinutes: dataa[i]['duratingInMinutes'],
                      location: dataa[i]['location'],
                      capacity: dataa[i]['capacity'],
                    );
                    fields.add(fielddd);
                  }
                  return ListView(
                    children: [
                      addverticalspace(20),
                      Text(
                        'Available Fields',
                        style: GeneralTheme.blackishtitle.copyWith(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      addverticalspace(20),
                      Row(
                        children: [
                          SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                  children: fields
                                      .map((e) => FieldItem(
                                            field: e,
                                            user: user,
                                          ))
                                      .toList())),
                        ],
                      ),
                    ],
                  );
                }
              }),
        ),
      ),
    );
  }
}
