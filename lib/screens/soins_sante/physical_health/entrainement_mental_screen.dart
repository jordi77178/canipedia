import 'package:flutter/material.dart';

class EntrainementMentalScreen extends StatelessWidget {
  final TextStyle _titleStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  final TextStyle _sectionTitleStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final TextStyle _textStyle = TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Entraînement mental")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/soins/cerebral.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),
              Text("Entraînement mental", style: _titleStyle),
              SizedBox(height: 10),
              Text(
                "Stimuler le cerveau de votre chien est essentiel pour son bien-être. L'entraînement mental aide à développer ses capacités cognitives et à réduire l'ennui.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Activités recommandées", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Jeux d'intelligence, puzzles alimentaires et séances de dressage adaptées.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Conseils pratiques", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Variez les exercices pour maintenir l'intérêt et récompensez les réussites pour encourager l'apprentissage.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Erreurs à éviter", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Ne forcez pas sur des exercices trop complexes et veillez à laisser des pauses pour éviter la surcharge mentale.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}