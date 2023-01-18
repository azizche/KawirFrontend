import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';
import 'package:kawir/common/theme.dart';
import 'package:kawir/common/usefulfunctions.dart';
import 'package:kawir/core/User.dart';
import 'package:kawir/screens/home/components/fielditem.dart';
import 'package:kawir/screens/home/homepage.dart';
import 'package:kawir/screens/signInUp/components/custombutton.dart';
import 'package:kawir/screens/signInUp/components/textformsign.dart';
import 'package:kawir/screens/signInUp/signinpageformat.dart';
import 'package:http/http.dart' as http;

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailcontroller = TextEditingController();
    final TextEditingController passwordcontroller = TextEditingController();
    final formkey = GlobalKey<FormState>();

    return GeneralSignPage(
      formkey: formkey,
      showbackbutton: false,
      title: 'Welcome back to \nKawir!',
      content: [
        addverticalspace(40),
        CustomTextField(
            controller: emailcontroller,
            color: Colors.white,
            prefixpadding: EdgeInsets.symmetric(horizontal: 50),
            icon: Icon(Icons.account_circle),
            hintText: 'Email'),
        addverticalspace(10),
        CustomTextField(
          controller: passwordcontroller,
          color: Colors.white,
          prefixpadding: EdgeInsets.symmetric(horizontal: 50),
          icon: Icon(CupertinoIcons.lock),
          hintText: 'Password',
        ),
        addverticalspace(10),
        Text(
          'Forgot password?',
          style: GeneralTheme.littlegreentext,
        ),
        addverticalspace(10),
        GestureDetector(
            onTap: () async {
              Response response = await http
                  .post(Uri.parse('http://10.0.2.2:3000/auth/login'), body: {
                'email': emailcontroller.text,
                'password': passwordcontroller.text,
              });

              if (response.statusCode == 201) {
                final data = json.decode(response.body);
                User user = User(
                  id: data['id'].toString(),
                  name: data['name'] ?? '',
                  email: data['email'] ?? '',
                  lastname: data['lastname'] ?? '',
                  phonenumber: int.parse(data['phonenumber']),
                );
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage(user: user)));
              } else if (response.statusCode == 404) {
                showsomrthing('User not found', context, Colors.red);
              }

              //Response responsea =
              //   await http.get(Uri.parse('http://10.0.2.2:3000/user'));

              // formkey.currentState!.validate();
            },
            child: CustomButton(text: 'Log in', sidepadding: 40.0)),
        addverticalspace(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have an account?",
              style: GeneralTheme.littlegreentext
                  .copyWith(color: maintextColor, fontWeight: FontWeight.w300),
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/signup'),
              child: Text(
                " Create one",
                style: GeneralTheme.littlegreentext,
              ),
            ),
          ],
        )
      ],
    );
  }
}

getuser() {}
