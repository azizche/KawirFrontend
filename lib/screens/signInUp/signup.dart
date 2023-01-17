import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kawir/common/usefulfunctions.dart';
import 'package:kawir/core/User.dart';
import 'package:kawir/screens/signInUp/components/custombutton.dart';
import 'package:kawir/screens/signInUp/components/textformsign.dart';
import 'package:kawir/screens/signInUp/signinpageformat.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formkey = GlobalKey<FormState>();
    final TextEditingController emailcontroller = TextEditingController();

    final TextEditingController namecontroller = TextEditingController();
    final TextEditingController lastnamecontroller = TextEditingController();
    final TextEditingController passwordcontroller = TextEditingController();
    final TextEditingController phonenumbercontroller = TextEditingController();

    return GeneralSignPage(
      formkey: formkey,
      showbackbutton: true,
      title: 'Create your \naccount',
      content: [
        addverticalspace(50),
        CustomTextField(
          controller: namecontroller,
          color: Colors.white,
          prefixpadding: EdgeInsets.symmetric(horizontal: 50),
          icon: Icon(Icons.account_circle_sharp),
          hintText: 'Name',
        ),
        addverticalspace(10),
        CustomTextField(
          controller: lastnamecontroller,
          color: Colors.white,
          prefixpadding: EdgeInsets.symmetric(horizontal: 50),
          icon: Icon(Icons.account_circle_sharp),
          hintText: 'Last Name',
        ),
        addverticalspace(10),
        CustomTextField(
          controller: phonenumbercontroller,
          color: Colors.white,
          prefixpadding: EdgeInsets.symmetric(horizontal: 50),
          icon: Icon(Icons.phone),
          hintText: 'Phone Number',
        ),
        addverticalspace(10),
        CustomTextField(
          controller: emailcontroller,
          color: Colors.white,
          prefixpadding: EdgeInsets.symmetric(horizontal: 50),
          icon: Icon(Icons.alternate_email),
          hintText: 'Email',
        ),
        addverticalspace(10),
        CustomTextField(
          controller: passwordcontroller,
          color: Colors.white,
          prefixpadding: EdgeInsets.symmetric(horizontal: 50),
          icon: Icon(CupertinoIcons.lock),
          hintText: 'Password',
        ),
        addverticalspace(10),
        GestureDetector(
            onTap: () {
              formkey.currentState!.validate();
              User user = User(
                  email: emailcontroller.text,
                  phonenumber: int.parse(phonenumbercontroller.text),
                  name: phonenumbercontroller.text,
                  lastname: lastnamecontroller.text);
            },
            child: CustomButton(text: 'Sign un', sidepadding: 40.0)),
        addverticalspace(10),
      ],
    );
  }
}
