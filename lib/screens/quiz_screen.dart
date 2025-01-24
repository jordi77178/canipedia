import 'package:flutter/material.dart';
import '../models/dog.dart';
import '../services/dog_service.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late Future<List<Dog>> _dogsFuture;
  int _questionIndex = 0;
  bool _showAnswer = false;

  @override
  void initState() {
    super.initState();
    _dogsFuture = DogService.loadDogs();
  }

  void _nextQuestion() {
    setState(() {
      _questionIndex = (_questionIndex + 1) % 10; // Limite à 10 questions max
      _showAnswer = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quiz sur les races")),
      body: FutureBuilder<List<Dog>>(
        future: _dogsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Erreur de chargement"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("Aucune race trouvée"));
          }

          final dog = snapshot.data![_questionIndex];

          return Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 5,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                        child: Image.network(dog.photoUrl, height: 200, width: double.infinity, fit: BoxFit.cover),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Text(
                              "Quelle est cette race ?",
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            if (_showAnswer)
                              Text(
                                dog.name,
                                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue),
                              ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _showAnswer = true;
                                });
                              },
                              child: Text("Afficher la réponse"),
                            ),
                            SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: _nextQuestion,
                              child: Text("Question suivante"),
                            ),
                          ],
                        ),
                      ),
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
}