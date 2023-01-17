import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kawir/common/theme.dart';
import 'package:kawir/common/usefulfunctions.dart';
import 'package:kawir/core/match.dart';

class MatchItem extends StatelessWidget {
  final Matche match;
  const MatchItem({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              imagepath + '/field.jpg',
              width: 250 - 16,
              fit: BoxFit.fitWidth,
            ),
            addverticalspace(5),
            Row(
              children: [
                Text(match.field.name),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.date_range),
                    Text(
                      match.start.day.toString() +
                          '/' +
                          match.start.month.toString(),
                      style: GeneralTheme.littlegreentext
                          .copyWith(color: Colors.blue),
                    )
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      imagepath + '/jersey.png',
                      width: 20,
                      height: 30,
                    ),
                    Text(((match.field.capacity) / 2).toString())
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.timer_outlined),
                    Text(
                      match.start.hour.toString() +
                          ':' +
                          match.start.minute.toString(),
                      style: GeneralTheme.littlegreentext
                          .copyWith(color: Colors.blue),
                    )
                  ],
                )
              ],
            ),
          ],
        ));
  }
}
