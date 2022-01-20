import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test_example/models/pokemon.dart';

void main() {
  group('Pokemon level up method', () {
    test('When a pokemon levels up, then it\'s level increases', () {
      // Arrange
      final pokemon = Pokemon(name: 'Bulbasaur');
      final initialLevel = pokemon.level;
      final expectedLevel = initialLevel + 1;
      // Act
      pokemon.levelUp();

      // Assert
      expect(pokemon.level, expectedLevel);
    });

    test('When a pokemon levels up, then it\'s HP increases 5%', () {
      // Arrange
      final pokemon = Pokemon(name: 'Bulbasaur');
      var expectedHp = pokemon.hp * 1.05;

      // Act
      pokemon.levelUp();

      // Assert
      expect(pokemon.hp, expectedHp);
    });

    test('When a json pokemon is received, fromJson converts it to a Pokemon',
        () {
      // Arrange
      Map<String, dynamic> json = {
        "species": {"name": "bulbasaur"},
        "sprites": {"front_default": "https://google.com"}
      };
      var expectedPokemon =
          Pokemon(name: 'bulbasaur', imageUrl: 'https://google.com');

      // Act
      var result = Pokemon.fromJson(json);

      // Assert
      expect(result.name, expectedPokemon.name);
      expect(result.imageUrl, expectedPokemon.imageUrl);
    });
  });
}
