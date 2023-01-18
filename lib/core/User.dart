import 'package:kawir/core/match.dart';

class User {
  String id;
  String name;
  String email;
  String lastname;
  int phonenumber;
  List<Matche>? matches;
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.lastname,
    required this.phonenumber,
    this.matches,
  });
}
