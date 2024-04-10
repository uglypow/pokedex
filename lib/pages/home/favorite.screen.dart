import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/pages/home/pokemon_detail_screen.dart';
import 'package:pokedex/provider/favorite_provider.dart';
import 'package:pokedex/services/utils.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    final pokemons = provider.pokemons;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0,
        toolbarHeight: 80,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ), // Custom leading icon
          onPressed: () => Navigator.pop(context), // Navigate back
        ), // Increase the height of the AppBar
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Favorite',
              style: TextStyle(
                fontSize: 36, // Increase the font size of the title
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        child: ListView.builder(
            padding: EdgeInsets.all(20),
            itemCount: pokemons.length,
            itemBuilder: (context, index) {
              final pokemon = pokemons[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PokemonDetailScreen(
                        pokemonDetail: pokemon,
                        color: getColorFromType(pokemon['type'][0]),
                        heroTag: index,
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey
                            .withOpacity(0.4), // Decrease the opacity
                        spreadRadius: 3, // Decrease the spread radius
                        blurRadius: 7, // Decrease the blur radius
                        offset: Offset(0, 3), // Decrease the offset
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(children: [
                              Container(
                                width: 60,
                                height: 60,
                                child: CachedNetworkImage(
                                  imageUrl: pokemon['img'],
                                  height: 200,
                                  fit: BoxFit.fitHeight,
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              ),
                              SizedBox(width: 10),
                              Flexible(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(pokemon['name'],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500)),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(pokemon['type'].join(', '),
                                          style: TextStyle(
                                              color: Colors.grey[500])),
                                    ]),
                              )
                            ]),
                          ),
                          GestureDetector(
                            onTap: () {
                              provider.toggleFavorite(pokemon);
                            },
                            child: AnimatedContainer(
                              height: 35,
                              padding: EdgeInsets.all(5),
                              duration: Duration(milliseconds: 300),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                  )),
                              child: Center(
                                  child: Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
