import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pokemon_flutter_app/components/components.dart';
import 'package:pokemon_flutter_app/widgets/pokedex.title.dart';
import 'package:pokemon_flutter_app/widgets/typewriter.text.dart';

class ForumScreen extends StatefulWidget {
  @override
  _ForumScreenState createState() => _ForumScreenState();
}

class _ForumScreenState extends State<ForumScreen> {
  final _firestore = Firestore.instance;

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
          stream: _firestore.collection('texts').snapshots(),
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
                        text: [
                          'Wait...',
                        ],
                        textStyle: kDefaultTextStyle.copyWith(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              final texts = snapshot.data.documents;
              List<String> textList = [];
              for (var t in texts) {
                String text = t.data['text'];
                textList.add(text);
              }
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: textList.length,
                      itemBuilder: (context, index) {
                        String text = textList[index];
                        return ListTile(
                          contentPadding: EdgeInsets.only(bottom: 8),
                          title: Text(
                            text,
                            style: kDefaultTextStyle.copyWith(fontSize: 12),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: kGreen,
                        width: 2
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: TextField(
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
                        Container(
                          child: Text(
                            'Send',
                            style: kDefaultTextStyle.copyWith(
                              fontSize: 12,
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
}

//TODO: refactor, all texts are of defaulttextstyle, so maybe there is a way to do this one time only in Theme
