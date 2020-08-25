import 'package:flutter/material.dart';
import 'package:pokemon_flutter_app/components/components.dart';

class ListText extends StatefulWidget {
  final int id;
  final String text;
  final controller = TextEditingController();

  ListText(this.id, this.text){
    controller.text = text;
  }

  @override
  _ListTextState createState() => _ListTextState();
}

class _ListTextState extends State<ListText> {
  bool trashCan = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 32,
            padding: const EdgeInsets.only(left:4),
            child: TextField(
              controller: widget.controller,
              onChanged: (value){
                trashCan = false;
                setState(() {});
                provider(context).updatePokemonList(widget.id, value);
              },
              onTap: (){
                trashCan = true;
                setState(() {});
              },
              style: kDefaultTextStyle.copyWith(fontSize: 12),
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                  border: InputBorder.none
              ),
            ),
          ),
        ),
        trashCan ? GestureDetector(
          onTap: (){
            provider(context).deletePokemon(widget.id);
            },
          child: Padding(
            padding: const EdgeInsets.only(right: 80, bottom: 4),
            child: Transform.scale(
              //TODO: instead of transformming image, change actual image size
                scale: 2,
                child: Image.asset('assets/trashcan.png')),
          ),
        ) : Container()
      ],
    );
  }
}
