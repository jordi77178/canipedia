import 'package:flutter/material.dart';
import '../models/dog.dart';
import '../services/dog_service.dart';

class GuessBiggerScreen extends StatefulWidget {
  @override
  _GuessBiggerScreenState createState() => _GuessBiggerScreenState();
}

class _GuessBiggerScreenState extends State<GuessBiggerScreen> {
  late Future<List<Dog>> _dogsFuture;
  int _score = 0;
  Dog? _dog1;
  Dog? _dog2;

  @override
  void initState() {
    super.initState();
    _dogsFuture = DogService.loadDogs().then((dogs) {
      setState(() {
        _dog1 = dogs[0];
        _dog2 = dogs[1];
      });
      return dogs;
    });
  }

  void _nextRound(List<Dog> dogs) {
    setState(() {
      dogs.shuffle();
      _dog1 = dogs[0];
      _dog2 = dogs[1];
    });
  }

  void _checkAnswer(bool firstIsBigger, List<Dog> dogs) {
    if ((_dog1!.poidsMax > _dog2!.poidsMax) == firstIsBigger) {
      setState(() {
        _score++;
      });
    }
    _nextRound(dogs);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Devine le plus lourd")),
      body: FutureBuilder<List<Dog>>(
        future: _dogsFuture,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

          return Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text("Score: $_score", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(child: _buildDogCard(_dog1!, true, snapshot.data!)),
                      SizedBox(width: 10),
                      Expanded(child: _buildDogCard(_dog2!, false, snapshot.data!)),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildDogCard(Dog dog, bool isFirst, List<Dog> dogs) {
    return GestureDetector(
      onTap: () => _checkAnswer(isFirst, dogs),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            Image.network(dog.photoUrl, height: 120, width: double.infinity, fit: BoxFit.cover),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(dog.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}