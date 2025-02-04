import 'package:flutter/material.dart';

class EssentialVaccinationsScreen extends StatelessWidget {
  final TextStyle _titleStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  final TextStyle _boldTextStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final TextStyle _textStyle = TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Vaccinations essentielles")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/soins/vaccin.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),
              Text("Vaccinations essentielles", style: _titleStyle),
              SizedBox(height: 10),
              Text(
                "Les vaccins protègent votre chien contre des maladies graves. Un suivi régulier avec votre vétérinaire garantit une immunisation efficace.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Avantages", style: _boldTextStyle),
              SizedBox(height: 10),
              Text(
                "Les vaccinations préviennent des infections virales et bactériennes potentiellement mortelles, telles que la rage ou la parvovirose.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Conseils pratiques", style: _boldTextStyle),
              SizedBox(height: 10),
              Text(
                "Respectez le calendrier vaccinal et n'hésitez pas à demander des rappels à votre vétérinaire.",
                style: _textStyle,
              ),
              SizedBox(height: 20),
              Text("Erreurs à éviter", style: _boldTextStyle),
              SizedBox(height: 10),
              Text(
                "Ne retardez pas les vaccinations et ne négligez pas les rappels. Une immunisation incomplète expose votre chien à des risques.",
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