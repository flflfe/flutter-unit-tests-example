import 'dart:math';

class Pokemon {
  final String name;
  String imageUrl;
  int level = 1;
  double hp = 100;

  Pokemon({required this.name, this.imageUrl = ''});

  void levelUp() {
    level++;
    hp *= 1.05;
  }

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['species']['name'],
      imageUrl: json['sprites']['front_default'],
    );
  }
}
