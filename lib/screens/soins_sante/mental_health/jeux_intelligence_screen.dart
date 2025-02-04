import 'package:flutter/material.dart';

class JeuxIntelligenceScreen extends StatelessWidget {
  final TextStyle _titleStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  final TextStyle _sectionTitleStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final TextStyle _textStyle = TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Jeux d’intelligence")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/soins/cerebral.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),
              Text("Jeux d’intelligence", style: _titleStyle),
              SizedBox(height: 10),
              Text(
                "Les jeux d’intelligence stimulent le cerveau de votre chien et aident à prévenir l’ennui. Ces activités renforcent également les capacités cognitives et la résolution de problèmes.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Avantages", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Amélioration des capacités cognitives, réduction de l’ennui et renforcement du lien entre le chien et son propriétaire.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Conseils pratiques", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Proposez une variété de jeux et adaptez la difficulté progressivement. Récompensez les réussites pour encourager la persévérance.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Erreurs à éviter", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Évitez les jeux trop complexes dès le départ et ne laissez pas le chien se décourager en cas d’échec.",
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