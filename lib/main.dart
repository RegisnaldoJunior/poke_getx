import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'view/pokemon_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pokémon Viewer',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PokemonView(),
    );
  }
}
