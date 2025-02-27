import 'dart:developer';
import 'dart:convert';

import 'package:firebase1/main.dart';
import 'package:firebase1/ui/dashborad.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

logintodash({required BuildContext context}) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => DashboradM()),
  );
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    TextEditingController EmailController = TextEditingController();
    TextEditingController PassController = TextEditingController();
    final screenHeight = MediaQuery.of(context).size.height;

    final screenWidth = MediaQuery.of(context).size.width;
    Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: orientation == Orientation.portrait
                    ? screenHeight * 0.1
                    : screenWidth * 0.05,
              ),
              Container(
                child: Text.rich(TextSpan(
                    text: "Login To Yours ",
                    style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: "mNews\n",
                          style: TextStyle(color: Colors.blue)),
                      TextSpan(
                        text: "Account Now",
                      )
                    ])),
                height: orientation == Orientation.portrait
                    ? screenHeight * 0.12
                    : screenWidth * 0.12,
                width: screenWidth * 1,
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Container(
                height: orientation == Orientation.portrait
                    ? screenHeight * 0.04
                    : screenWidth * 0.04,
                width: screenWidth * 1,
                child: Text(
                  "Email",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: TextField(
                  controller: EmailController,
                  decoration: InputDecoration(
                    hintText: "Your Acitve Email",
                    hintStyle: TextStyle(color: Colors.grey),
                    suffixIcon: Icon(Icons.email),
                    prefixIconColor: Colors.grey,
                    filled: true,
                    fillColor: const Color.fromARGB(248, 232, 232, 235),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none),
                  ),
                ),
                width: screenWidth * 1,
                height: orientation == Orientation.portrait
                    ? screenHeight * 0.08
                    : screenWidth * 0.08,
              ),
              Container(
                height: orientation == Orientation.portrait
                    ? screenHeight * 0.04
                    : screenWidth * 0.04,
                width: screenWidth * 1,
                child: Text(
                  "Password",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: TextField(
                  controller: PassController,
                  decoration: InputDecoration(
                    hintText: "Your Acitve Password",
                    hintStyle: TextStyle(color: Colors.grey),
                    suffixIcon: Icon(Icons.password),
                    prefixIconColor: Colors.grey,
                    filled: true,
                    fillColor: const Color.fromARGB(248, 232, 232, 235),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none),
                  ),
                ),
                width: screenWidth * 1,
                height: orientation == Orientation.portrait
                    ? screenHeight * 0.08
                    : screenWidth * 0.08,
              ),
              SizedBox(
                height: orientation == Orientation.portrait
                    ? screenHeight * 0.02
                    : screenWidth * 0.02,
              ),
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                      onPressed: () {
                        loginverify(
                            EmailController: EmailController.text,
                            PassController: PassController.text,
                            Context: context);
                      },
                      child: Text(
                        "Submit",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )),
                ),
                height: orientation == Orientation.portrait
                    ? screenHeight * 0.07
                    : screenWidth * 0.07,
                width: screenWidth * 1,
              ),
              SizedBox(
                height: orientation == Orientation.portrait
                    ? screenHeight * 0.01
                    : screenWidth * 0.01,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.grey,
                        height: 1,
                        width: screenWidth * 0.41,
                      ),
                      Text("OR"),
                      Container(
                        color: Colors.grey,
                        height: 1,
                        width: screenWidth * 0.41,
                      )
                    ],
                  ),
                ),
                height: orientation == Orientation.portrait
                    ? screenHeight * 0.08
                    : screenWidth * 0.08,
              ),
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue, // Border color
                        width: 1.0, // Border width (1 pixel)
                      ),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icons/Google.png",
                        height: 26,
                      ),
                      Text(
                        "oogle",
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      )
                    ],
                  ),
                  height: orientation == Orientation.portrait
                      ? screenHeight * 0.08
                      : screenWidth * 0.08,
                ),
                onTap: () {
                  // action code
                },
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Container(
                child: Row(
                  children: [
                    Text(
                      "Don't have mNews account yet?",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      "Create One",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                height: orientation == Orientation.portrait
                    ? screenHeight * 0.08
                    : screenWidth * 0.04,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void loginverify(
      {required String EmailController,
      required String PassController,
      required BuildContext Context}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: EmailController, password: PassController)
          .then((value) {
        return log("Logins Success");
      });

     
    } catch (e) {
      print("Error: $e");
    }
  }
}
