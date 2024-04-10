import 'package:flutter/material.dart';

Color getColorFromType(String type) {
  switch (type) {
    case 'Grass':
      return Colors.greenAccent;
    case 'Fire':
      return Colors.redAccent;
    case 'Water':
      return Colors.blueAccent;
    case 'Bug':
      return Colors.lightGreen;
    case 'Normal':
      return Colors.brown;
    case 'Poison':
      return Colors.deepPurple;
    case 'Electric':
      return Colors.amber;
    case 'Ground':
      return Colors.orange;
    case 'Fighting':
      return Colors.red.shade900;
    case 'Psychic':
      return Colors.pink;
    case 'Rock':
      return Colors.grey;
    case 'Ghost':
      return Colors.indigo;
    case 'Ice':
      return Colors.lightBlue;
    case 'Dragon':
      return Colors.indigo.shade400;
    default:
      return Colors.grey;
  }
}