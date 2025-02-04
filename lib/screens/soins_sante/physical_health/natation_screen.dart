import 'package:flutter/material.dart';

class NatationScreen extends StatelessWidget {
  final TextStyle _titleStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  final TextStyle _sectionTitleStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final TextStyle _textStyle = TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Natation")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/soins/natation.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),
              Text("Natation", style: _titleStyle),
              SizedBox(height: 10),
              Text(
                "La natation est un excellent exercice pour tonifier les muscles tout en préservant les articulations. Elle convient particulièrement aux chiens ayant des problèmes articulaires ou en convalescence.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Avantages", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Renforcement musculaire, amélioration de la circulation sanguine et faible impact sur les articulations.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Conseils pratiques", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Assurez-vous que l'eau est propre et à la bonne température. Surveillez votre chien en permanence pour éviter tout risque.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Erreurs à éviter", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Ne laissez jamais votre chien sans surveillance près d'un plan d'eau et évitez de forcer la natation en cas de fatigue.",
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