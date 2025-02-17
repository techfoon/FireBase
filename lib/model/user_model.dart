import 'package:flutter/foundation.dart';

class UserModel {
  String? Class;

  String uid;

  String? name;

  UserModel({ required this.uid,  required this.name, required this.Class});

  factory UserModel.FromJson(Map<String, dynamic> JSON) {
    return UserModel(
      
      uid: "",
      
      Class: JSON['class'], name: JSON['name']);
  }
}
