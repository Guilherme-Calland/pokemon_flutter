import 'package:flutter/material.dart';
import 'package:pokemon_flutter_app/components/components.dart';

class ListText extends StatelessWidget {
  String text;
  ListText(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Text(text, style: kDefaultTextStyle.copyWith(fontSize: 12),),
    );
  }
}
