import 'package:flutter/material.dart';
import 'package:pokedex/provider/pokemon_provider.dart';
import 'package:pokedex/screens/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PokemonProvider(),
      child: MaterialApp(
        theme: ThemeData(canvasColor: Colors.transparent),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
