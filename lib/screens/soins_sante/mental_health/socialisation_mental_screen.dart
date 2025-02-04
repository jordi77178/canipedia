import 'package:flutter/material.dart';

class SocialisationMentalScreen extends StatelessWidget {
  final TextStyle _titleStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  final TextStyle _sectionTitleStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final TextStyle _textStyle = TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Socialisation")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/soins/socialisation.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),
              Text("Socialisation", style: _titleStyle),
              SizedBox(height: 10),
              Text(
                "La socialisation aide votre chien à développer des interactions positives avec d'autres chiens et personnes, ce qui est crucial pour son bien-être mental.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Avantages", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Amélioration des compétences sociales, réduction du stress et développement de la confiance en soi.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Conseils pratiques", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Organisez des rencontres régulières dans des environnements calmes et positifs pour renforcer la socialisation.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Erreurs à éviter", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Évitez les environnements trop bruyants ou stressants qui pourraient aggraver l'anxiété de votre chien.",
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