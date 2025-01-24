import 'package:flutter/material.dart';

class AdventureModeScreen extends StatefulWidget {
  @override
  _AdventureModeScreenState createState() => _AdventureModeScreenState();
}

class _AdventureModeScreenState extends State<AdventureModeScreen> {
  int _level = 1;

  void _nextLevel() {
    setState(() {
      _level++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mode Aventure 🏆")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Niveau $_level",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      "Question du niveau $_level",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Quel chien est le plus rapide ?",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: _nextLevel,
                          child: Text("Greyhound"),
                        ),
                        ElevatedButton(
                          onPressed: _nextLevel,
                          child: Text("Labrador"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}