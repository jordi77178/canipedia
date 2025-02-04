import 'package:flutter/material.dart';

class RoutinesRepereScreen extends StatelessWidget {
  final TextStyle _titleStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  final TextStyle _sectionTitleStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final TextStyle _textStyle = TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Routines et repères")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/soins/routine.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),
              Text("Routines et repères", style: _titleStyle),
              SizedBox(height: 10),
              Text(
                "Une routine stable aide à réduire l'anxiété en fournissant à votre chien des repères clairs et prévisibles dans son quotidien.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Avantages", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Réduction du stress, amélioration de la confiance et anticipation des activités quotidiennes.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Conseils pratiques", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Établissez un horaire régulier pour les repas, les sorties et le repos, et respectez-le autant que possible.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Erreurs à éviter", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Ne modifiez pas fréquemment les routines et évitez les imprévus qui pourraient déstabiliser votre chien.",
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