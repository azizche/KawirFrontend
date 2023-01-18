import 'package:kawir/core/Field.dart';
import 'package:kawir/core/User.dart';

class Matche {
  String id;
  Field field;
  DateTime start;
  DateTime finish;
  Matche({
    required this.id,
    required this.field,
    required this.start,
    required this.finish,
  });
}
