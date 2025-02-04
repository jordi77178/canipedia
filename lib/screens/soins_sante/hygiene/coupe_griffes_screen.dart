import 'package:flutter/material.dart';

class CoupeGriffesScreen extends StatelessWidget {
  final TextStyle _titleStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  final TextStyle _subtitleStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final TextStyle _textStyle = TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Coupe des griffes")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/soins/nails.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),
              Text("Coupe des griffes", style: _titleStyle),
              SizedBox(height: 10),
              Text(
                "La coupe régulière des griffes est indispensable pour le confort et la sécurité de votre chien. Des griffes trop longues peuvent causer des douleurs, des blessures et des problèmes de posture.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Fréquence recommandée", style: _subtitleStyle),
              SizedBox(height: 10),
              Text(
                "Il est recommandé de tailler les griffes toutes les 4 semaines ou dès que vous entendez un cliquetis sur une surface dure.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Conseils pratiques", style: _subtitleStyle),
              SizedBox(height: 10),
              Text(
                "Utilisez un coupe-griffes adapté aux animaux. Veillez à ne pas couper trop court et récompensez votre chien après la séance pour associer ce moment à une expérience positive.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Erreurs à éviter", style: _subtitleStyle),
              SizedBox(height: 10),
              Text(
                "Ne forcez pas la coupe en cas de résistance et évitez de couper trop près de la zone sensible afin de prévenir toute douleur ou saignement.",
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