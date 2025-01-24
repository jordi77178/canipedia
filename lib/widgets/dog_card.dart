import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_flags/country_flags.dart';
import '../models/dog.dart';
import '/screens/dog_details_screen.dart';

class DogCard extends StatelessWidget {
  final Dog dog;

  const DogCard({required this.dog, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 500),
            pageBuilder: (_, __, ___) => DogDetailsScreen(dog: dog),
            transitionsBuilder: (_, animation, __, child) {
              return FadeTransition(opacity: animation, child: child);
            },
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              spreadRadius: 2,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              // ✅ Image principale avec gestion des erreurs
              Hero(
                tag: dog.name,
                child: CachedNetworkImage(
                  imageUrl: dog.photoUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => Image.asset(
                    'assets/images/default_dog.jpg',
                    fit: BoxFit.cover,
                  ),
                  placeholder: (context, url) => Container(
                    height: 200,
                    color: Colors.grey[300],
                    child: Center(child: CircularProgressIndicator()),
                  ),
                ),
              ),

              // ✅ Dégradé sombre pour lisibilité du texte
              Container(
                height: 200,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                  ),
                ),
              ),

              // ✅ Contenu texte
              Positioned(
                bottom: 10,
                left: 12,
                right: 12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dog.name,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        // ✅ Ajout du drapeau
                        if (dog.flags.isNotEmpty)
                          CountryFlag.fromCountryCode(
                            dog.flags.first.toUpperCase(),
                            height: 20,
                            width: 30,
                          ),
                        SizedBox(width: 8),
                        Text(
                          dog.origin,
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}