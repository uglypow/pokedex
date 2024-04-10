import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  List _pokemons = [];
  List get pokemons => _pokemons;

  void toggleFavorite(pokemon) {
    final isExist = _pokemons.contains(pokemon);
    if (isExist) {
      _pokemons.remove(pokemon);
    } else {
      _pokemons.add(pokemon);
    }
    notifyListeners();
  }

  bool isExist(pokemon) {
    final isExist = _pokemons.contains(pokemon);
    return isExist;
  }

  void clearFavorite() {
    _pokemons = [];
    notifyListeners();
  }
}
