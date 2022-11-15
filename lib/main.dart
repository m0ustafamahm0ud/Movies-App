import 'package:flutter/material.dart';
import 'package:movie_app/movies/presentation/screens/main_movies_screen.dart';

import 'core/utils/services.dart';

void main() {
  ServiceLocator().init();
// another change
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainMoviesScreen(),
    );
  }
}
