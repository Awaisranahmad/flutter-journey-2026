import 'package:flutter/material.dart';
import 'hero_screen_two.dart';

class HeroScreenOne extends StatelessWidget {
  const HeroScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hero Animation - 1')),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const HeroScreenTwo()),
            );
          },
          child: Hero(
            tag: 'profile_pic', // Dono screens mein same tag hona chahiye
            child: Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
                image: DecorationImage(
                  image: NetworkImage(
                    'https://picsum.photos/200',
                  ), // Sample Image
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
