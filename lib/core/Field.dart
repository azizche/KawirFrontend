import 'dart:convert';

import 'package:kawir/core/User.dart';
import 'package:kawir/core/match.dart';

class Field {
  String id;
  String name;
  int ownerPhonenumber;
  double price;
  int durationInMinutes;
  String location;
  int capacity;

  Field({
    required this.id,
    required this.name,
    required this.ownerPhonenumber,
    required this.price,
    required this.durationInMinutes,
    required this.location,
    required this.capacity,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'ownerPhonenumber': ownerPhonenumber,
      'price': price,
      'durationInMinutes': durationInMinutes,
      'location': location,
      'capacity': capacity,
    };
  }

  factory Field.fromMap(Map<String, dynamic> map) {
    return Field(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      ownerPhonenumber: map['ownerPhonenumber']?.toInt() ?? 0,
      price: map['price']?.toDouble() ?? 0.0,
      durationInMinutes: map['durationInMinutes']?.toInt() ?? 0,
      location: map['location'] ?? '',
      capacity: map['capacity']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Field.fromJson(String source) => Field.fromMap(json.decode(source));
}
