import 'package:kawir/core/User.dart';
import 'package:kawir/core/match.dart';

class Field {
  String name;
  int ownerPhonenumber;
  double price;
  int durationInMinutes;
  String location;
  int capacity;

  Field({
    required this.name,
    required this.ownerPhonenumber,
    required this.price,
    required this.durationInMinutes,
    required this.location,
    required this.capacity,
  });
}
