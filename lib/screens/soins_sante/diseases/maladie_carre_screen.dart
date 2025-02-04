import 'package:flutter/material.dart';

class MaladieCarreScreen extends StatelessWidget {
  final TextStyle _titleStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  final TextStyle _sectionTitleStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final TextStyle _textStyle = TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Maladie de Carré")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/soins/carre.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),
              Text("Maladie de Carré", style: _titleStyle),
              SizedBox(height: 10),
              Text(
                "La Maladie de Carré est une infection virale grave qui affecte les voies respiratoires, digestives et nerveuses des chiens.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Symptômes", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Fièvre, toux, troubles digestifs, convulsions et troubles neurologiques dans les cas sévères.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Traitement et prévention", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Il n'existe pas de traitement spécifique. La prévention par la vaccination et un suivi régulier chez le vétérinaire sont essentiels.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Conseils pratiques", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Vaccinez votre chien dès son plus jeune âge et consultez rapidement un vétérinaire en cas de symptômes.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Erreurs à éviter", style: _sectionTitleStyle),
              SizedBox(height: 10),
              Text(
                "Ne tardez pas à consulter et ne comptez pas sur des remèdes maison pour traiter cette maladie grave.",
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