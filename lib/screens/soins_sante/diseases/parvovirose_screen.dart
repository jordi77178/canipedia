import 'package:flutter/material.dart';

class ParvoviroseScreen extends StatelessWidget {
  final TextStyle _titleStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  final TextStyle _sectionTitleStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final TextStyle _textStyle = TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Parvovirose")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/soins/parvovirose.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),
              Text("Parvovirose", style: _titleStyle),
              SizedBox(height: 10),
              Text(
                "La parvovirose est une infection virale extrêmement contagieuse qui affecte principalement l’intestin des chiots et peut s’avérer mortelle.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Symptômes", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Vomissements, diarrhée sévère, déshydratation et léthargie sont les principaux symptômes.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Traitement et prévention", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Les soins de soutien intensifs et la vaccination sont essentiels pour combattre la parvovirose.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Conseils pratiques", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Vaccinez votre chiot et surveillez tout signe de déshydratation pour agir rapidement.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Erreurs à éviter", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Ne tardez pas à consulter en cas de symptômes et ne négligez pas les signes de déshydratation.",
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