import 'package:flutter/material.dart';

class ParasitesVermifugesScreen extends StatelessWidget {
  final TextStyle _titleStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  final TextStyle _boldTextStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final TextStyle _textStyle = TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Parasites et vermifuges")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/soins/vermifuge.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),
              Text("Parasites et vermifuges", style: _titleStyle),
              SizedBox(height: 10),
              Text(
                "Les parasites externes (puces, tiques) et internes (vers) peuvent affecter gravement la santé de votre chien. Un traitement régulier est indispensable.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Avantages du traitement", style: _boldTextStyle),
              SizedBox(height: 10),
              Text(
                "Un traitement antiparasitaire prévient les infections, améliore le confort de votre animal et limite la transmission de maladies.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Conseils pratiques", style: _boldTextStyle),
              SizedBox(height: 10),
              Text(
                "Consultez votre vétérinaire pour choisir le traitement adapté et respectez le calendrier recommandé.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Erreurs à éviter", style: _boldTextStyle),
              SizedBox(height: 10),
              Text(
                "Ne pas traiter régulièrement peut entraîner une infestation sévère et des complications de santé.",
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