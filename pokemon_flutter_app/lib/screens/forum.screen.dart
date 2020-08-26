import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ForumScreen extends StatelessWidget {
  final _fireStore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Forum'),
          FlatButton(
            child: Text('push me'),
            color: Colors.green,
            onPressed: (){
              _fireStore.collection('test').add({
                'something1' : "text1",
                'something2' : 'text2',
              });
            },
          )
        ],
      ),
    );
  }
}
