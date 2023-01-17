import 'package:flutter/material.dart';
import 'package:kawir/common/theme.dart';
import 'package:kawir/common/usefulfunctions.dart';
import 'package:kawir/core/Field.dart';
import 'package:kawir/screens/home/components/fielditem.dart';
import 'package:kawir/screens/home/components/matchitem.dart';

class FieldsPage extends StatelessWidget {
  const FieldsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Field greenfield = Field(
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
          child: ListView(
            children: [
              addverticalspace(20),
              Text(
                'Available Fields',
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
                              teste.map((e) => FieldItem(field: e)).toList())),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
