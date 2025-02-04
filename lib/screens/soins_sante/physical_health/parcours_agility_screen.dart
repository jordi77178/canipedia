import 'package:flutter/material.dart';

class ParcoursAgilityScreen extends StatelessWidget {
  final TextStyle _titleStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  final TextStyle _sectionTitleStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final TextStyle _textStyle = TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Parcours d'agility")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/soins/agility.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),
              Text("Parcours d'agility", style: _titleStyle),
              SizedBox(height: 10),
              Text(
                "Les parcours d'agility offrent un excellent moyen de combiner exercice physique et stimulation mentale. Ils renforcent l'agilité, la coordination et la confiance en soi de votre chien.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Avantages", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Amélioration de la coordination, stimulation mentale et renforcement des muscles.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Conseils pratiques", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Commencez avec des obstacles simples et augmentez progressivement la difficulté. Récompensez les succès pour encourager votre chien.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Erreurs à éviter", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Ne forcez pas votre chien à franchir des obstacles trop difficiles et évitez les parcours trop intenses pour éviter la fatigue excessive.",
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