import 'package:flutter/material.dart';
import 'package:pokemon_flutter_app/components/components.dart';

class ListText extends StatelessWidget {
  final int id;
  final String text;
  ListText(this.id, this.text);

  final controller = TextEditingController();

  @override

  Widget build(BuildContext context) {
    controller.text = text;
    return Container(
      height: 32,
      padding: const EdgeInsets.only(left:4),
      child: TextField(
        controller: controller,
        onChanged: (value){
          provider(context).updatePokemonList(id, value);
        },
        style: kDefaultTextStyle.copyWith(fontSize: 12),
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
            border: InputBorder.none
        ),
      ),
    );
  }
}
