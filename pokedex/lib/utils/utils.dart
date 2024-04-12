import 'package:flutter/material.dart';

Text Name(String name) {
  return Text(name,
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white));
}

Text NameLarge(String name) {
  return Text(name,
      style: TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white));
}

Text IdStyle(String id) {
  return Text(id,
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white));
}

Chip typeChip(String type) {
  return Chip(
    padding: EdgeInsets.all(4),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(40)),
        side: BorderSide(color: Colors.transparent, width: 0)),
    backgroundColor: Colors.transparent.withOpacity(0.2),
    label: Text(
      type,
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w400, fontSize: 15),
    ),
  );
}

Map<String, Color> typeColorMap = {
  'grass': const Color.fromARGB(255, 76, 175, 137),
  'fire': const Color.fromARGB(255, 227, 74, 63),
  'water': const Color.fromARGB(255, 48, 133, 203),
  'electric': const Color.fromARGB(255, 221, 191, 23),
  'bug': const Color.fromARGB(255, 104, 195, 34),
  'ground': const Color.fromARGB(255, 93, 65, 55),
  'poison': const Color.fromARGB(255, 61, 26, 132),
  'normal': const Color.fromARGB(255, 96, 96, 96)
  // Add more mappings for other Pokémon types
};
Color getTypeColor(String type) {
  return typeColorMap[type.toLowerCase()] ??
      const Color.fromARGB(
          255, 96, 96, 96); // Default color is grey if type not found
}
