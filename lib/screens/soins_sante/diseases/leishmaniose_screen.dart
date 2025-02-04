import 'package:flutter/material.dart';

class LeishmanioseScreen extends StatelessWidget {
  final TextStyle _titleStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  final TextStyle _sectionTitleStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final TextStyle _textStyle = TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Leishmaniose")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/soins/leishmaniose.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),
              Text("Leishmaniose", style: _titleStyle),
              SizedBox(height: 10),
              Text(
                "La leishmaniose est une maladie parasitaire transmise par les phlébotomes et peut être mortelle sans traitement approprié.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Symptômes", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Perte de poids, problèmes cutanés, faiblesse générale et fièvre.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Traitement", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Le traitement repose sur des médicaments antiparasitaires et des soins de soutien, avec un suivi régulier par le vétérinaire.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Conseils pratiques", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Protégez votre chien des piqûres de phlébotomes et consultez rapidement en cas de symptômes suspects.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Erreurs à éviter", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Ne tentez pas un traitement sans avis vétérinaire et ne retardez pas la consultation en cas de symptômes.",
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