import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:mockito/annotations.dart';
import 'package:unit_test_example/data/pokemon_api_client.dart';
import 'package:unit_test_example/models/pokemon.dart';

@GenerateMocks([http.Client])
void main() {
  group('getPokemon method', () {
    test(
        'When response\'s status code is not 200, getPokemon returns an empty list',
        () async {
      // Arrange
      final client = MockClient((request) async {
        return Response('', 404);
      });
      final pokemonClient = PokemonApiClient(client: client);
      final expectedResult = [];

      // Act
      final result = await pokemonClient.getPokemon();

      // Assert
      expect(result, expectedResult);
    });

    test(
        'When response\'s status code is 200, getPokemon returns a pokemon list',
        () async {
      // Arrange
      final client = MockClient((request) async {
        return Response(
            '{"species": {"name": "bulbasaur"}, "sprites": {"front_default": ""}}',
            200);
      });
      final pokemonClient = PokemonApiClient(client: client);

      // Act
      final result = await pokemonClient.getPokemon();

      // Assert
      expect(result.length, 10);
    });
  });
}
