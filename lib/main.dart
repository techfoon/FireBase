import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase1/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MaterialApp(
    home: DashBoard(),
  ));
}

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 600,
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection("User").snapshots(),
                  builder: (context, snap) {
                    if (snap.hasData) {
                      return snap.data!.docs.isNotEmpty
                          ? ListView.builder(
                              itemCount: snap.data!.docs.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: Text(
                                      "${snap.data!.docs[index].data()['class']}"),
                                  title: Text(
                                      "${snap.data!.docs[index].data()['name']}"),
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
