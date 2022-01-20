import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test_example/models/pokemon.dart';

void main() {
  group('Pokemon level up method', () {
    test('When a pokemon levels up, then it\'s level increases', () {
      // Arrange
      final pokemon = Pokemon(name: 'Bulbasaur');

      // Act
      pokemon.levelUp();

      // Assert
      expect(pokemon.level, 2);
    });

    test('When a pokemon levels up, then it\'s HP increases 5%', () {
      // Arrange
      final pokemon = Pokemon(name: 'Bulbasaur');
      var finalHp = pokemon.hp * 1.05;
      // Act
      pokemon.levelUp();

      // Assert
      expect(pokemon.hp, finalHp);
    });
  });
}
