import 'package:firebase1/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

  void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp( options: DefaultFirebaseOptions.currentPlatform);
  runApp(MaterialApp(
    home: DashBoard(),
  ));
}

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [



        ],
      ),
    );
  }
}
