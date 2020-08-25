import 'package:flutter/material.dart';
import 'package:pokemon_flutter_app/components/components.dart';
import 'package:pokemon_flutter_app/screens/pokedex.cover.screen.dart';
import 'package:pokemon_flutter_app/screens/menu.screen.dart';
import 'package:pokemon_flutter_app/screens/your.profile.screen.dart';
import 'package:pokemon_flutter_app/shared/shared.data.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

//TODO: change icon
//TODO: (optional) make so that the open menu animation reverses any time you tap the square
//TODO: change orientation to portrait

main() async{
  runApp(
    PokemonApp(),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp]
  )
  ;
}

class PokemonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SharedData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.red,
            accentColor: Color(0xff282828),
            //the cursor color is the same as the background color
            cursorColor: Color(0xff282828),
            primarySwatch: kBackgroundMaterialColor
        ),

        initialRoute: 'pokedex.cover.screen',
        routes: {
          'pokedex.cover.screen': (context) => PokedexCoverScreen(),
          'menu.screen': (context) => MenuScreen(),
          'your.profile.screen': (context) => YourProfileScreen(),
        },
      ),
    );
  }
}
