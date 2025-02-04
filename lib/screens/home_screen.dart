import 'package:canipedia/screens/country_selection_screen.dart';
import 'package:canipedia/screens/education_canine/education_home_screen.dart';
import 'package:canipedia/screens/education_screen.dart';
import 'package:canipedia/screens/map_screen.dart';
import 'package:canipedia/screens/soins_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../services/dog_service.dart';
import '../models/dog.dart';
import 'encyclopedie_screen.dart';
import 'dog_details_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Dog? _featuredDog;

  @override
  void initState() {
    super.initState();
    _loadFeaturedDogs();
  }

  List<Dog> _featuredDogs = []; // Liste des 4 chiens en vedette

  Future<void> _loadFeaturedDogs() async {
    final dogs = await DogService.loadDogs();
    if (dogs.length >= 4) {
      setState(() {
        int startIndex = DateTime.now().day % (dogs.length - 3);
        _featuredDogs = dogs.sublist(startIndex, startIndex + 4); // Sélectionne 4 chiens
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 70),
              _buildHeader().animate().fade(duration: 700.ms).slideY(begin: -0.2, curve: Curves.easeOut),
              const SizedBox(height: 10),
              _featuredDogs.isNotEmpty
                  ? _buildFeaturedDogsCarousel().animate().scale(delay: 300.ms).fadeIn()
                  : const CircularProgressIndicator(),
              const SizedBox(height: 10),
              Expanded(child: _buildMenuCarousel(context)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedDogsCarousel() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 230,
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 4),
        viewportFraction: 0.85,
        aspectRatio: 2.0,
      ),
      items: _featuredDogs.map((dog) => _buildFeaturedDogCard(dog)).toList(),
    ).animate().fade(duration: 1.seconds).slideY(begin: 0.2, curve: Curves.easeOut);
  }

  Widget _buildHeader() {
    return Column(
      children: [
        const Text(
          "CaniPédia",
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            letterSpacing: 1.2,
          ),
          textAlign: TextAlign.center,
        ).animate().fade(duration: 800.ms).slideY(begin: -0.2),
        const SizedBox(height: 5),

        Image.asset(
          "assets/images/logo.webp", // Remplace par le chemin correct de ton logo
          height: 150, // Ajuste la taille selon ton besoin
        ).animate().fade(duration: 800.ms).scaleXY(begin: 0.9, end: 1),
      ],
    );
  }

  Widget _buildFeaturedDogCard(Dog dog) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DogDetailsScreen(dog: dog)),
        );
      },
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                dog.photoUrl,
                height: 220,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                ),
              ),
            ),
            Positioned(
              left: 20,
              bottom: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dog.name,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Text(
                    dog.origin,
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                ],
              ),
            ),
          ],
        ),
      ).animate().moveY(begin: 10, end: 0, duration: 1.seconds, curve: Curves.easeInOut),
    );
  }
  Widget _buildMenuCarousel(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 250, // Ajustement pour meilleure lisibilité
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 4),
        viewportFraction: 0.8,
        aspectRatio: 2.0,
      ),
      items: [
        _buildMenuCard(context, "Encyclopédie", "assets/images/encyclopedie.png", EncyclopedieScreen()),
        _buildMenuCard(context, "Jeux & Quiz", "assets/images/quiz.png", EncyclopedieScreen()),
        _buildMenuCard(context, "Éducation canine", "assets/images/dressage.png", EducationHomeScreen()),
        _buildMenuCard(context, "Soins & Santé", "assets/images/soin.png", SoinsHomeScreen()),
        _buildMenuCard(context, "Chiens par Pays", "assets/images/chiens_pays.png", CountrySelectionScreen()),
      ],
    ).animate().fade(duration: 1.seconds).slideY(begin: 0.2, curve: Curves.easeOut);
  }

// 🏆 Design amélioré pour chaque carte du menu
  Widget _buildMenuCard(BuildContext context, String title, String imagePath, Widget destination) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => destination)),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            // 📸 Image d’arrière-plan
            Positioned.fill(
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            // 🎨 Dégradé pour meilleure lisibilité
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                  ),
                ),
              ),
            ),
            // 📝 Texte au centre avec effet d’apparition
            Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black54,
                      blurRadius: 5,
                    ),
                  ],
                ),
              ).animate().fade(duration: 800.ms).scaleXY(begin: 0.9, end: 1),
            ),
          ],
        ),
      ).animate().scaleXY(begin: 0.85, end: 1, duration: 500.ms, curve: Curves.easeOut),
    );
  }


}