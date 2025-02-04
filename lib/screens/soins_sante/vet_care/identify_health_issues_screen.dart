import 'package:flutter/material.dart';

class IdentifyHealthIssuesScreen extends StatelessWidget {
  final TextStyle _titleStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  final TextStyle _boldTextStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final TextStyle _textStyle = TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Identifier un problème de santé")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/soins/detecter.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),
              Text("Identifier un problème de santé", style: _titleStyle),
              SizedBox(height: 10),
              Text(
                "Repérer rapidement les signes inquiétants (changement d'appétit, fatigue, vomissements, etc.) permet d'intervenir à temps et de prévenir des complications graves.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Signes à surveiller", style: _boldTextStyle),
              SizedBox(height: 10),
              Text(
                "Soyez attentif aux modifications du comportement, à la léthargie ou aux troubles digestifs. Ces signaux peuvent indiquer un problème de santé sous-jacent.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Conseils pratiques", style: _boldTextStyle),
              SizedBox(height: 10),
              Text(
                "Notez tous les symptômes et consultez rapidement un vétérinaire pour obtenir un diagnostic précis.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Erreurs à éviter", style: _boldTextStyle),
              SizedBox(height: 10),
              Text(
                "Ne minimisez pas les symptômes et évitez l'automédication. Un retard dans la consultation peut aggraver l'état de santé de votre chien.",
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