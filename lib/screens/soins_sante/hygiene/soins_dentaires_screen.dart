import 'package:flutter/material.dart';

class SoinsDentairesScreen extends StatelessWidget {
  final TextStyle _titleStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  final TextStyle _subtitleStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final TextStyle _textStyle = TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Soins dentaires")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/soins/dentaire.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),
              Text("Soins dentaires", style: _titleStyle),
              SizedBox(height: 10),
              Text(
                "Un brossage régulier (2 à 3 fois par semaine) est essentiel pour prévenir le tartre et les infections buccales. Cela contribue à une meilleure hygiène dentaire et à la santé globale de votre chien.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Importance du brossage", style: _subtitleStyle),
              SizedBox(height: 10),
              Text(
                "Le brossage élimine les résidus alimentaires et réduit la formation de plaque dentaire, prévenant ainsi les maladies parodontales.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Conseils pratiques", style: _subtitleStyle),
              SizedBox(height: 10),
              Text(
                "Utilisez une brosse et un dentifrice spécialement conçus pour les chiens. Habituez progressivement votre animal à ce geste en le récompensant.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Erreurs à éviter", style: _subtitleStyle),
              SizedBox(height: 10),
              Text(
                "N'utilisez jamais de dentifrice humain et évitez un brossage trop vigoureux afin de protéger les gencives.",
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