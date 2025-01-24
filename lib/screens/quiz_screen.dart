import 'package:flutter/material.dart';
import '../models/dog.dart';
import '../services/dog_service.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late List<Dog> dogs;
  late Dog dog1;
  late Dog dog2;
  int score = 0;

  @override
  void initState() {
    super.initState();
    _loadDogs();
  }

  Future<void> _loadDogs() async {
    dogs = await DogService.loadDogs();
    _newRound();
  }

  void _newRound() {
    dogs.shuffle();
    dog1 = dogs[0];
    dog2 = dogs[1];
    setState(() {});
  }

  void _checkAnswer(bool isDog1Taller) {
    if ((isDog1Taller && dog1.tailleMax > dog2.tailleMax) ||
        (!isDog1Taller && dog1.tailleMax < dog2.tailleMax)) {
      setState(() => score++);
    } else {
      setState(() => score = 0);
    }
    _newRound();
  }

  @override
  Widget build(BuildContext context) {
    if (dogs.isEmpty) return Center(child: CircularProgressIndicator());

    return Scaffold(
      appBar: AppBar(title: Text("Quiz: Qui est plus grand ?")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Score: $score", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          _buildDogOption(dog1, true),
          Text("OU", style: TextStyle(fontSize: 18)),
          _buildDogOption(dog2, false),
        ],
      ),
    );
  }

  Widget _buildDogOption(Dog dog, bool isDog1) {
    return GestureDetector(
      onTap: () => _checkAnswer(isDog1),
      child: Column(
        children: [
          Image.network(dog.photoUrl, height: 120),
          Text(dog.name, style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}