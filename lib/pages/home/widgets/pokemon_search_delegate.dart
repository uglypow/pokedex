import 'package:flutter/material.dart';

class PokemonSearchDelegate extends SearchDelegate<dynamic> {
  final List<dynamic>? pokedex;
  final Function(dynamic)? onPokemonSelected;

  PokemonSearchDelegate({this.pokedex, this.onPokemonSelected});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final filteredPokedex = filterPokedex(query);

    return ListView.builder(
      itemCount: filteredPokedex.length,
      itemBuilder: (context, index) {
        final pokemon = filteredPokedex[index];
        return ListTile(
          title: Text(pokemon['name']),
          onTap: () {
            onPokemonSelected?.call(pokemon);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final filteredPokedex = filterPokedex(query);

    return ListView.builder(
      itemCount: filteredPokedex.length,
      itemBuilder: (context, index) {
        final pokemon = filteredPokedex[index];
        return ListTile(
          title: Text(pokemon['name']),
          onTap: () {
            onPokemonSelected?.call(pokemon);
          },
        );
      },
    );
  }

  List<dynamic> filterPokedex(String query) {
    if (query.isEmpty) {
      return pokedex!;
    }

    final lowercaseQuery = query.toLowerCase();
    return pokedex!.where((pokemon) {
      final lowercaseName = pokemon['name'].toLowerCase();
      return lowercaseName.contains(lowercaseQuery);
    }).toList();
  }
}