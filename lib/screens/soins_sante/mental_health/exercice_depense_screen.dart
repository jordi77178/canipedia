import 'package:flutter/material.dart';

class ExerciceDepenseScreen extends StatelessWidget {
  final TextStyle _titleStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  final TextStyle _sectionTitleStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final TextStyle _textStyle = TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Exercice et dépense physique")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/soins/exercice.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),
              Text("Exercice et dépense physique", style: _titleStyle),
              SizedBox(height: 10),
              Text(
                "Un exercice régulier aide à canaliser l'énergie de votre chien et contribue à son bien-être mental en réduisant l'anxiété et le stress.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Avantages", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Amélioration de l'humeur, réduction du stress et meilleure qualité de sommeil.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Conseils pratiques", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Adaptez l'intensité de l'exercice aux capacités de votre chien et variez les activités pour éviter la monotonie.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Erreurs à éviter", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Ne forcez pas votre chien et évitez les exercices trop intenses pouvant causer des blessures.",
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