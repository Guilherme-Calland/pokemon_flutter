import 'package:cloud_firestore/cloud_firestore.dart';

class Message{
  String userName;
  String message;
  Timestamp date;

  Message({this.userName, this.message, this.date});
}

