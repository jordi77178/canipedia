import 'package:flutter/material.dart';

class FirstAidScreen extends StatelessWidget {
  final TextStyle _titleStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  final TextStyle _boldTextStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final TextStyle _textStyle = TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Premiers secours")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/soins/secours.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),
              Text("Premiers secours", style: _titleStyle),
              SizedBox(height: 10),
              Text(
                "Savoir appliquer les gestes d'urgence peut sauver la vie de votre chien. Cette section vous présente les bases des premiers secours en cas d'incident (hémorragies, brûlures, intoxications, etc.).",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Protocoles d'urgence", style: _boldTextStyle),
              SizedBox(height: 10),
              Text(
                "Apprenez les étapes à suivre en cas d'urgence et comment stabiliser votre animal en attendant l'arrivée des secours.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Conseils pratiques", style: _boldTextStyle),
              SizedBox(height: 10),
              Text(
                "Ayez une trousse de premiers secours pour animaux à portée de main et suivez une formation de base en premiers secours.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Erreurs à éviter", style: _boldTextStyle),
              SizedBox(height: 10),
              Text(
                "N'essayez pas d'interventions complexes sans formation. En cas de doute, contactez immédiatement un vétérinaire.",
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