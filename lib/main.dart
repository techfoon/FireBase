import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase1/firebase_options.dart';
import 'package:firebase1/model/user_model.dart';

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

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  late Future<QuerySnapshot<Map<String, dynamic>>> mUsers ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   mUsers = FirebaseFirestore.instance.collection("User").get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 600,
              child: FutureBuilder <QuerySnapshot<Map<String, dynamic>>>(
                  future: mUsers,
                  builder: (context, snap) {
                    if (snap.hasData) {
                      return snap.data!.docs.isNotEmpty
                          ? ListView.builder(
                              itemCount: snap.data!.docs.length,

                              itemBuilder: (context, index) {
                                var currUser = UserModel.FromJson(
                                   snap.data!.docs[index].data());                              ///  here is coding mistake
                                return ListTile(

                                  leading:  Text("${index+1}"),
                                  title: Text(
                                      "${ currUser.name}"),
                               subtitle: Text(
                                      "${currUser.Class}"),
                                );
                              })
                          : Container(
                              child: Text("NoData available"),
                            );
                    } else {
                      return Center(
                          child: Container(
                        child: Text("failed"),
                      ));
                    }
                  }),
            ),
            ElevatedButton(
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection("User")
                      .add({"name": "aman", "class": "!2th"});

                  setState(() {});
                },
                child: Text("Click Here"))
          ],
        ),
      ),
    );
  }
}


class Main extends StatelessWidget {
const Main({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container();
  }
}