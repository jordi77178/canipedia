import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'screens/quiz_screen.dart'; // ✅ Import du quiz
import 'services/dog_service.dart';
import 'models/dog.dart';
import 'package:flame/flame.dart';

void main() {
  runApp(CaniPediaApp());
}

class CaniPediaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DogProvider(),
      child: MaterialApp(
        title: 'Canipédia',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        routes: {
          '/quiz': (context) => QuizScreen(), // ✅ Ajout de la route Quiz
        },
      ),
    );
  }
}

class DogProvider extends ChangeNotifier {
  List<Dog> _dogs = [];

  List<Dog> get dogs => _dogs;

  Future<void> loadDogs() async {
    _dogs = await DogService.loadDogs();
    notifyListeners();
  }
}