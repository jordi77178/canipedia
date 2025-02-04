import 'package:flutter/material.dart';

class CanicrossJoggingScreen extends StatelessWidget {
  final TextStyle _titleStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  final TextStyle _sectionTitleStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final TextStyle _textStyle = TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Canicross & Jogging")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/soins/canicross.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),
              Text("Canicross & Jogging", style: _titleStyle),
              SizedBox(height: 10),
              Text(
                "Le canicross et le jogging avec votre chien sont d'excellents exercices pour améliorer l'endurance, la force et la complicité entre vous et votre compagnon.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Avantages", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Amélioration de l'endurance, renforcement musculaire et meilleure coordination.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Conseils pratiques", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Commencez progressivement, choisissez des parcours sécurisés et veillez à adapter l'intensité de l'exercice au niveau de votre chien.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Erreurs à éviter", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Évitez les exercices trop intensifs dès le début et ne forcez jamais votre chien au-delà de ses limites.",
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