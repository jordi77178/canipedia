import 'package:flutter/material.dart';

class MassageCaresseScreen extends StatelessWidget {
  final TextStyle _titleStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  final TextStyle _sectionTitleStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final TextStyle _textStyle = TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Massage et caresses")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/soins/caresse.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),
              Text("Massage et caresses", style: _titleStyle),
              SizedBox(height: 10),
              Text(
                "Les massages et caresses favorisent la détente musculaire et aident à réduire le stress. Ils renforcent également le lien affectif entre vous et votre chien.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Avantages", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Détente musculaire, réduction du stress et amélioration de la circulation sanguine.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Conseils pratiques", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Apprenez les techniques de massage adaptées aux chiens et commencez par des caresses douces pour habituer votre animal.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Erreurs à éviter", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Ne massez pas trop fort et évitez les zones sensibles sans une formation préalable.",
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