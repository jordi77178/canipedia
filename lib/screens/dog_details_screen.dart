import 'package:flutter/material.dart';
import 'package:country_flags/country_flags.dart';
import '../models/dog.dart';

class DogDetailsScreen extends StatelessWidget {
  final Dog dog;

  const DogDetailsScreen({required this.dog, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(dog.name)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(dog.photoUrl, height: 250, width: double.infinity, fit: BoxFit.cover),
            ),
            SizedBox(height: 20),

            // ✅ Correction : Affichage des drapeaux avec Wrap()
            Wrap(
              spacing: 8,
              children: dog.flags.map((flag) {
                return CountryFlag.fromCountryCode(flag.toUpperCase(), height: 30, width: 45);
              }).toList(),
            ),

            SizedBox(height: 10),
            Text(dog.origin, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(dog.description, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}