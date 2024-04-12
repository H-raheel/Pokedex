import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/provider/pokemon_provider.dart';
import 'package:pokedex/screens/pokemon.dart';
import 'package:pokedex/utils/utils.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<PokemonProvider>(context, listen: false).getAllPokemon();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(left: 4, right: 4, top: 100, bottom: 8),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text("Pokedex",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Color.fromARGB(228, 77, 75, 75))),
          ),
          Consumer<PokemonProvider>(
            builder: (context, value, child) {
              if (value.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              final pokemons = value.pokemon;
              return Expanded(
                child: GridView.builder(
                    // shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 4 / 3),
                    itemCount: pokemons.length,
                    itemBuilder: (context, index) {
                      return PokemonCard(pokemon: pokemons[index]);
                    }),
              );
            },
          ),
        ]),
      ),
    );
  }
}

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PokemonScreen(
                      pokemon: pokemon,
                    )));
      },
      child: Card(
        color: getTypeColor(pokemon.type != null ? pokemon.type![0] : ""),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Positioned(
                  bottom: 0,
                  right: 0,
                  top: 30,
                  child: Expanded(child: Image.network(pokemon.img!))),
              Positioned(
                left: 10,
                top: 20,
                child: Name(pokemon.name ?? ""),
              ),
              Positioned(
                left: 5,
                top: 40,
                child: typeChip(pokemon.type != null ? pokemon.type![0] : ""),
              )
            ],
          ),
        ),
      ),
    );
  }

 
}
