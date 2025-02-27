import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase1/firebase_options.dart';
import 'package:firebase1/model/user_model.dart';
import 'package:firebase1/ui/login.dart';

import 'package:firebase1/ui/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MaterialApp(
    home: Signup(),
  ));
}



