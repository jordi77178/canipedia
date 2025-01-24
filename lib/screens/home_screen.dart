import 'package:flutter/material.dart';
import '../models/dog.dart';
import '../services/dog_service.dart';
import 'encyclopedie_screen.dart';
import 'quiz_screen.dart';
import 'game_guess_bigger.dart';
import '/screens/adventure_mode_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Canipédia"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "Bienvenue sur Canipédia 🐶",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),

            // 📌 Carte "Chien à découvrir"
            FutureBuilder<List<Dog>>(
              future: DogService.loadDogs(),
              builder: (context, snapshot) {
                if (!snapshot.hasData || snapshot.data!.isEmpty) return SizedBox();

                final randomDog = (snapshot.data!..shuffle()).first;

                return Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 5,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                        child: Image.network(randomDog.photoUrl, height: 150, width: double.infinity, fit: BoxFit.cover),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Text(
                              "Découvre une race !",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              randomDog.name,
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
                            ),
                            SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => EncyclopedieScreen()),
                              ),
                              child: Text("En savoir plus"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 20),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildMenuCard(
                    context,
                    title: "Encyclopédie",
                    icon: Icons.menu_book,
                    color: Colors.blue,
                    destination: EncyclopedieScreen(),
                  ),
                  _buildMenuCard(
                    context,
                    title: "Quiz",
                    icon: Icons.quiz,
                    color: Colors.orange,
                    destination: QuizScreen(),
                  ),
                  _buildMenuCard(
                    context,
                    title: "Devine la Race",
                    icon: Icons.games,
                    color: Colors.green,
                    destination: GuessBiggerScreen(),
                  ),
                  _buildMenuCard(
                    context,
                    title: "Mode Aventure",
                    icon: Icons.explore,
                    color: Colors.purple,
                    destination: AdventureModeScreen(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context, {required String title, required IconData icon, required Color color, required Widget destination}) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => destination)),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: color,
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 50, color: Colors.white),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}