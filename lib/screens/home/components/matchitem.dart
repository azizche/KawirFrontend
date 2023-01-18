import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'package:kawir/common/theme.dart';
import 'package:kawir/common/usefulfunctions.dart';
import 'package:kawir/core/match.dart';
import 'package:kawir/screens/signInUp/components/custombutton.dart';

import '../../../core/User.dart';

class MatchItem extends StatefulWidget {
  User user;
  final Matche match;
  MatchItem({
    Key? key,
    required this.user,
    required this.match,
  }) : super(key: key);

  @override
  State<MatchItem> createState() => _MatchItemState();
}

class _MatchItemState extends State<MatchItem> {
  bool show = true;

  @override
  Widget build(BuildContext context) {
    return show
        ? Container(
            margin: EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(8),
            height: 260,
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
                    Text(widget.match.field.name),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.date_range),
                        Text(
                          widget.match.start.day.toString() +
                              '/' +
                              widget.match.start.month.toString(),
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
                        Text(((widget.match.field.capacity) / 2).toString())
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.timer_outlined),
                        Text(
                          widget.match.start.hour.toString() +
                              ':' +
                              widget.match.start.minute.toString(),
                          style: GeneralTheme.littlegreentext
                              .copyWith(color: Colors.blue),
                        )
                      ],
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () async {
                    Response response = await http.delete(Uri.parse(
                        'http://10.0.2.2:3000/match/${widget.match.id}'));
                    print(response.body);
                    setState(() {
                      show = false;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 30,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Cancel',
                      textAlign: TextAlign.center,
                      style: GeneralTheme.buttonText,
                    ),
                  ),
                )
              ],
            ))
        : Container();
  }
}
