import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unit_test_example/data/pokemon_client.dart';
import 'package:unit_test_example/models/pokemon.dart';

void main() => runApp(const Home());

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PokemonClient client = PokemonClient();
  List<Pokemon> pokemons = [];

  @override
  void initState() {
    client.getPokemon().then((value) {
      setState(() {
        pokemons = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Treine seus pokemon!'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: pokemons.isEmpty
                  ? const Center(
                      child: Text('Ops... você ainda não capturou pokemon!'),
                    )
                  : ListView.builder(
                      itemCount: pokemons.length,
                      itemBuilder: (context, index) {
                        var pokemon = pokemons[index];
                        return ListTile(
                          leading: SizedBox(
                            height: 500,
                            width: 100,
                            child: Image.network(
                              pokemon.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(pokemon.name),
                          subtitle: Text(
                            'Hp: ${pokemon.hp.toStringAsFixed(2)}, Lv ${pokemon.level}',
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                pokemon.levelUp();
                              });
                            },
                          ),
                        );
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}
