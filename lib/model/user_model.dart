import 'package:flutter/foundation.dart';

class LoginModel {
  String email;

  LoginModel({required this.email});

  factory LoginModel.FromJson(Map<String, dynamic> JSON) {
    return LoginModel(email: JSON['email']);
  }

  Map<String, dynamic> FromDoc() {
    return {'email': email};
  }
}
