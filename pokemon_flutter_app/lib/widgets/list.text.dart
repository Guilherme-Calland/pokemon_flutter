import 'package:flutter/material.dart';
import 'package:pokemon_flutter_app/components/components.dart';

class ListText extends StatefulWidget {
  final int id;
  final String text;
  final controller = TextEditingController();
  final String pokemonOrAccomplishment;

  ListText({this.id, this.text, this.pokemonOrAccomplishment}){
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
            padding: const EdgeInsets.only(left:4),
            child: TextField(
              maxLines: null,
              controller: widget.controller,
              onChanged: (value){
                trashCan = false;
                setState(() {});
                widget.pokemonOrAccomplishment == 'pokemon' ?
                provider(context).updatePokemonList(widget.id, value)
                    :
                provider(context).updateAccomplishmentList(widget.id, value);
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
            widget.pokemonOrAccomplishment == 'pokemon' ?
                provider(context).deletePokemon(widget.id)
                :
                provider(context).deleteAccomplishment(widget.id);
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 80, bottom: 4),
            child: Image.asset('assets/trashcan.png'),
          ),
        ) : Container()
      ],
    );
  }
}
