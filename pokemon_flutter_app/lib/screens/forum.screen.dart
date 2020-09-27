import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pokemon_flutter_app/components/components.dart';
import 'package:pokemon_flutter_app/model/message.dart';
import 'package:pokemon_flutter_app/widgets/pokedex.title.dart';
import 'package:pokemon_flutter_app/widgets/profile.button.dart';
import 'package:pokemon_flutter_app/widgets/typewriter.text.dart';

class ForumScreen extends StatelessWidget {
  final _firestore = Firestore.instance;
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(right: 48),
          child: PokedexTitle(),
        ),
        //setting leading as an empty container to remove the return arrow
        leading: Container(),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 48),
        child: StreamBuilder<QuerySnapshot>(
          stream: _firestore
              .collection('messages')
              .orderBy('date', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 100),
                      child: TypewriterAnimatedTextKit(
                        isRepeatingAnimation: true,
                        speed: Duration(milliseconds: 500),
                        text: ['...', 'Wait...'],
                        textStyle: kDefaultTextStyle.copyWith(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              final messages = snapshot.data.documents;
              List<Message> messageList = [];
              for (var m in messages) {
                String userName = m.data['userName'];
                String message = m.data['message'];
                Timestamp date = m.data['date'];
                var newMessage =
                    Message(userName: userName, message: message, date: date);
                messageList.add(newMessage);
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileButton(
                    text: 'Back',
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  Expanded(
                    child: ListView.builder(
                      reverse: true,
                      itemCount: messageList.length,
                      itemBuilder: (context, index) {
                        Message message = messageList[index];
                        return ListTile(
                          contentPadding: EdgeInsets.only(bottom: 8),
                          title: Text(
                            '${message.userName}: ${message.message}',
                            style: kDefaultTextStyle.copyWith(fontSize: 12),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: kGreen, width: 2),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: TextField(
                              controller: _textController,
                              style: kDefaultTextStyle.copyWith(
                                fontSize: 12,
                              ),
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 14),
                          height: 50,
                          child: VerticalDivider(
                            thickness: 2,
                            color: kGreen,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            sendMessage(context);
                          },
                          child: Container(
                            child: Text(
                              'Send',
                              style: kDefaultTextStyle.copyWith(
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  void sendMessage(BuildContext context) {
    String userName = provider(context).userName;
    String message = _textController.text;
    DateTime date = DateTime.now();
    _firestore.collection('messages').add(
      {
        'userName': userName,
        'message': message,
        'date': date,
      },
    );
    _textController.clear();
  }
}

//TODO: refactor, all texts are of defaulttextstyle, so maybe there is a way to do this one time only in Theme
//TODO:  make a 'back' button
//TODO: feature: faça com que os usuarios possam ver o perfil dos outros, para isso, crie um objeto User e doso os users estao no firebase
//TODO: para fazer a feature anterior ficar ótima, seria melhor existir um cadastro com senha
