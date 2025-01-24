import 'package:flutter/material.dart';

class AccueilScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Accueil')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/encyclopedie'),
              child: Text('Explorer les races de chiens'),
            ),
          ],
        ),
      ),
    );
  }
}