import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Icon(
                      Icons.menu,
                      size: 30,
                      color: Colors.black
                  ),
                  SizedBox(width: 5,),
                  Text('Pokemon App', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),

                ],
              ),
              FlatButton(

              ),
            ],
          ),
        )
    );
  }
}
