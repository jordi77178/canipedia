import 'package:flutter/material.dart';

class RoutineVisitsScreen extends StatelessWidget {
  final TextStyle _titleStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  final TextStyle _boldTextStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final TextStyle _textStyle = TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Visites de routine")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/soins/visiteveto.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),
              Text("Visites de routine", style: _titleStyle),
              SizedBox(height: 10),
              Text(
                "Un check-up annuel chez le vétérinaire permet de détecter précocement d'éventuels problèmes de santé et de maintenir votre chien en bonne santé.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Avantages", style: _boldTextStyle),
              SizedBox(height: 10),
              Text(
                "Des visites régulières permettent une prévention efficace, un suivi personnalisé et la détection précoce des maladies.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Conseils pratiques", style: _boldTextStyle),
              SizedBox(height: 10),
              Text(
                "Préparez une liste de questions, suivez un calendrier annuel et assurez-vous que votre chien est à jour dans ses vaccinations.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Erreurs à éviter", style: _boldTextStyle),
              SizedBox(height: 10),
              Text(
                "N'attendez pas l'apparition de symptômes graves pour consulter. Ne négligez pas les visites de contrôle.",
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