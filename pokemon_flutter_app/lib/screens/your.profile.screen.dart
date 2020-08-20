import 'package:flutter/material.dart';
import 'package:pokemon_flutter_app/components/components.dart';
import 'package:pokemon_flutter_app/widgets/list.text.dart';
import 'package:pokemon_flutter_app/widgets/pokedex.title.dart';
import 'package:pokemon_flutter_app/widgets/typewriter.text.dart';

class YourProfileScreen extends StatefulWidget {
  @override
  _YourProfileScreenState createState() => _YourProfileScreenState();
}

class _YourProfileScreenState extends State<YourProfileScreen> {
  var nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    //TODO: make the update the user name here
  }

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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 16, top:48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Name:', style: kDefaultTextStyle,),
                  Expanded(
                    child: TextField(
                      controller: nameController,
                      style: kDefaultTextStyle,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        border: InputBorder.none
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32,),
              TypewriterText('Your Pokemon:'),
              Row(
                children: [
                  SizedBox(width: 100,),
                  Column(
                    children: [
                      ListText('Blastoise'),
                      ListText('Blastoise'),
                      ListText('Blastoise'),
                      ListText('Blastoise'),
                      ListText('Blastoise'),
                      ListText('Blastoise'),
                      ListText('Blastoise'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


