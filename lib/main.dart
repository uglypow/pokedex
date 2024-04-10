import 'package:flutter/material.dart';
import 'package:pokedex/pages/login/login_screen.dart';
import 'package:pokedex/provider/favorite_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavoriteProvider(),
      child: MaterialApp(
        home: LoginScreen(),
      ),
    );
  }
}
