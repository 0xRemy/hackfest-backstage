import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class RealtimeTransactionsDisplay extends StatefulWidget {
  const RealtimeTransactionsDisplay({Key? key}) : super(key: key);

  @override
  RealtimeTransactionsDisplayState createState() =>
      RealtimeTransactionsDisplayState();
}

class RealtimeTransactionsDisplayState
    extends State<RealtimeTransactionsDisplay> {
  final databaseRef =
      FirebaseDatabase.instance.reference().child("Transaction");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FirebaseAnimatedList(
        query: databaseRef,
        itemBuilder: (BuildContext context, DataSnapshot snapshot,
            Animation<double> animation, int index) {
          var x = snapshot.value['Date'];
          // ignore: avoid_print
          print(x);
          return ListTile(
            subtitle: Text(snapshot.value['Date']),
            title: Text(snapshot.value['Date']),
          );
        },
      )),
    );
  }
}
