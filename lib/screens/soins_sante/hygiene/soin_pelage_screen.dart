import 'package:flutter/material.dart';

class SoinPelageScreen extends StatelessWidget {
  final TextStyle _titleStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  final TextStyle _subtitleStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final TextStyle _textStyle = TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Soin du pelage")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/soins/brossage.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),
              Text("Soin du pelage", style: _titleStyle),
              SizedBox(height: 10),
              Text(
                "Un brossage régulier est essentiel pour maintenir un pelage sain, réduire la perte de poils et prévenir les nœuds. Il permet également d'éliminer les poils morts et de stimuler la circulation sanguine.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Fréquence recommandée", style: _subtitleStyle),
              SizedBox(height: 10),
              Text(
                "Il est conseillé de brosser le pelage 2 à 3 fois par semaine, voire quotidiennement pour les chiens à poils longs.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Conseils pratiques", style: _subtitleStyle),
              SizedBox(height: 10),
              Text(
                "Utilisez une brosse adaptée au type de poil de votre chien. Commencez doucement pour habituer votre animal au brossage et récompensez-le afin de rendre cette routine agréable.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Erreurs à éviter", style: _subtitleStyle),
              SizedBox(height: 10),
              Text(
                "Évitez de brosser un pelage mouillé ou sale, ce qui peut causer des irritations. Ne forcez pas le brossage dans les zones très emmêlées sans les démêler préalablement.",
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