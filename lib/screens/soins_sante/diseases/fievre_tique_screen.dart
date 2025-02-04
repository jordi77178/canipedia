import 'package:flutter/material.dart';

class FievreTiqueScreen extends StatelessWidget {
  final TextStyle _titleStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  final TextStyle _sectionTitleStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final TextStyle _textStyle = TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fièvre de la tique")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/soins/tique.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),
              Text("Fièvre de la tique", style: _titleStyle),
              SizedBox(height: 10),
              Text(
                "La fièvre de la tique est une infection bactérienne transmise par les tiques qui provoque fièvre, anémie et malaise général chez le chien.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Symptômes", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Fièvre élevée, léthargie, perte d'appétit et parfois des troubles de coagulation.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Traitement", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Le traitement repose sur des antibiotiques et des soins de soutien pour corriger l'anémie et prévenir les complications.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Conseils pratiques", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Surveillez votre chien après une morsure de tique et consultez un vétérinaire dès les premiers signes de fièvre.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Erreurs à éviter", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Ne tardez pas à consulter et n'essayez pas de traiter la maladie sans avis professionnel.",
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