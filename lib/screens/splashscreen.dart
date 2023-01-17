import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../common/theme.dart';
import '../common/usefulfunctions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2))
        .then((value) => Navigator.pushReplacementNamed(context, '/signin'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        width: getsize(context).width,
        height: getsize(context).height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imagepath + 'logo.png',
              width: 150,
              fit: BoxFit.fitWidth,
            ),
            addverticalspace(15),
            Text(
              'Kawir',
              textAlign: TextAlign.center,
              style: GeneralTheme.greentitle,
            ),
          ],
        ),
      ),
    );
    ;
  }
}
