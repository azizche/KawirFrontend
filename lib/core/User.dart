import 'package:kawir/core/match.dart';

class User {
  String name;
  String email;
  String lastname;
  int phonenumber;
  List<Matche>? matches;
  User({
    required this.name,
    required this.email,
    required this.lastname,
    required this.phonenumber,
    this.matches,
  });
}
