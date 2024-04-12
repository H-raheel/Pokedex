import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/utils/utils.dart';

class PokemonScreen extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonScreen({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Container(
              color: getTypeColor(pokemon.type != null ? pokemon.type![0] : ""),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                    ),
                  ),
                ],
              )),
          Positioned(
              bottom: 0,
              // top: MediaQuery.of(context).size.height * 0.75,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.6,
                padding: EdgeInsets.only(top: 20, left: 20),
              )),
          Positioned(
            right: 0,
            left: 0,
            bottom: MediaQuery.of(context).size.height * 0.55,
            child: SizedBox(
              height: MediaQuery.of(context).size.width * 0.5,
              width: MediaQuery.of(context).size.width * 0.5,
              child: Image.network(
                pokemon.img ?? "",
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: MediaQuery.of(context).size.height * 0.05,
            child: NameLarge(pokemon.name ?? ""),
          ),
          Positioned(
            right: 20,
            top: MediaQuery.of(context).size.height * 0.05,
            child: IdStyle("#" + pokemon.id.toString() ?? ""),
          ),
          Positioned(
            left: 20,
            top: MediaQuery.of(context).size.height * 0.1,
            child: typeChip(pokemon.type
                .toString()
                .replaceAll("]", "")
                .replaceAll("[", "")),
          ),
          Positioned(
              bottom: MediaQuery.of(context).size.height * 0.3,
              left: 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Detail(quality: "Name", value: pokemon.name ?? ""),
                  Detail(quality: "Height", value: pokemon.height ?? ""),
                  Detail(quality: "Weight", value: pokemon.weight ?? ""),
                  Detail(quality: "Spawn Time", value: pokemon.spawnTime ?? ""),
                  Detail(
                      quality: "Weeknesses",
                      value: pokemon.weaknesses
                          .toString()
                          .replaceAll("]", "")
                          .replaceAll("[", "")),
                  Detail(
                      quality: "Pre Evolution",
                      value: pokemon.preEvolution
                                  .toString()
                                  .replaceAll("]", "")
                                  .replaceAll("[", "") ==
                              "null"
                          ? ""
                          : pokemon.preEvolution
                              .toString()
                              .replaceAll("]", "")
                              .replaceAll("[", "")),
                  Detail(
                      quality: "Next Evolution",
                      value: pokemon.nextEvolution
                                  .toString()
                                  .replaceAll("]", "")
                                  .replaceAll("[", "") ==
                              "null"
                          ? ""
                          : pokemon.nextEvolution
                              .toString()
                              .replaceAll("]", "")
                              .replaceAll("[", ""))
                ],
              ))
        ],
      ),
    ));
  }
}

class Detail extends StatelessWidget {
  final String quality;
  final String value;

  const Detail({super.key, required this.quality, required this.value});

  // final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: Text(
            quality,
            style: const TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 128, 127, 127),
                fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.05,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: Text(value,
              style: TextStyle(
                fontSize: 18,
              )),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.08,
        )
      ],
    );
  }
}
