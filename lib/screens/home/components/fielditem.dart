import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'package:kawir/common/theme.dart';
import 'package:kawir/common/usefulfunctions.dart';
import 'package:kawir/core/Field.dart';
import 'package:kawir/core/match.dart';
import 'package:kawir/screens/signInUp/components/custombutton.dart';

import '../../../core/User.dart';

class FieldItem extends StatelessWidget {
  final Field field;
  User user;
  FieldItem({
    Key? key,
    required this.field,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDialog(
          context: context, builder: (context) => builddialog(context, user)),
      child: Container(
          margin: EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(8),
          height: 230,
          width: 250,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                imagepath + 'field.jpg',
                width: 250 - 16,
                fit: BoxFit.fitWidth,
              ),
              addverticalspace(5),
              Row(
                children: [
                  Text(field.name),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      Text(
                        field.price.toString() + 'Dt',
                        style: GeneralTheme.littlegreentext
                            .copyWith(color: Colors.blue),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        imagepath + 'jersey.png',
                        width: 20,
                        height: 30,
                      ),
                      Text(((field.capacity) / 2).toString())
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.timelapse_rounded),
                      Text(
                        field.durationInMinutes.toString() + ' minutes',
                        style: GeneralTheme.littlegreentext
                            .copyWith(color: Colors.blue),
                      )
                    ],
                  )
                ],
              ),
            ],
          )),
    );
  }

  builddialog(context, User user) {
    return Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(8),
        height: 300,
        width: 250,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imagepath + 'field.jpg',
              width: getsize(context).width - 8,
              fit: BoxFit.fitWidth,
            ),
            addverticalspace(5),
            Row(
              children: [
                Text(
                  field.name,
                  style: GeneralTheme.blackishtitle,
                ),
              ],
            ),
            addverticalspace(10),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.attach_money,
                      size: 30,
                    ),
                    Text(
                      field.price.toString() + 'Dt',
                      style: GeneralTheme.littlegreentext
                          .copyWith(color: Colors.blue, fontSize: 20),
                    )
                  ],
                ),
                addverticalspace(10),
                Row(
                  children: [
                    Image.asset(
                      imagepath + 'jersey.png',
                      width: 30,
                      height: 40,
                    ),
                    Text(
                      ' ' + ((field.capacity) / 2).toString(),
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                addverticalspace(10),
                Row(
                  children: [
                    Icon(
                      Icons.timelapse_rounded,
                      size: 30,
                    ),
                    Text(
                      field.durationInMinutes.toString() + ' minutes',
                      style: GeneralTheme.littlegreentext
                          .copyWith(color: Colors.blue, fontSize: 20),
                    )
                  ],
                ),
                addverticalspace(10),
                Row(
                  children: [
                    Icon(
                      Icons.phone,
                      size: 30,
                    ),
                    Text(
                      field.ownerPhonenumber.toString(),
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                addverticalspace(10),
                GestureDetector(
                    onTap: () async {
                      Response response = await http.put(
                          Uri.parse(
                              'http://10.0.2.2:3000/user/${user.id}/reserve'),
                          body: {
                            'start': DateTime.now().toString(),
                            'finish': DateTime.now()
                                .add(Duration(minutes: field.durationInMinutes))
                                .toString(),
                            'field': field.id,
                          });
                      showsomrthing(
                          'Match Succesfully booked', context, Colors.red);
                      print(response.body);
                      print('yeey');
                    },
                    child: CustomButton(text: 'Book now!', sidepadding: 22.0))
              ],
            ),
          ],
        ));
  }
}

showsomrthing(message, context, color) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: color,
        content: Text(message),
      );
    },
  );
}
