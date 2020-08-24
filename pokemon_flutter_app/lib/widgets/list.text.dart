import 'package:flutter/material.dart';
import 'package:pokemon_flutter_app/components/components.dart';

class ListText extends StatelessWidget {
  String text;
  ListText(this.text);

  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controller.text = text;

    return Container(
      height: 32,
      padding: const EdgeInsets.only(left:4),
      child: TextField(
        controller: controller,
        style: kDefaultTextStyle.copyWith(fontSize: 12),
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
            border: InputBorder.none
        ),
      ),
    );
  }
}
