import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view_model/pokemon_controller.dart';

class PokemonView extends StatelessWidget {
  final PokemonController _controller = Get.put(PokemonController());
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesquisar Pokémon'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Nome do Pokémon',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _controller.searchPokemon(_textController.text);
              },
              child: Text('Pesquisar'),
            ),
            SizedBox(height: 16),
            Obx(() {
              if (_controller.isLoading.value) {
                return CircularProgressIndicator();
              }

              if (_controller.errorMessage.isNotEmpty) {
                return Text(
                  _controller.errorMessage.value,
                  style: TextStyle(color: Colors.red),
                );
              }

              final pokemon = _controller.pokemon.value;
              if (pokemon != null) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      pokemon.imageUrl,
                      width: 150,
                      height: 150,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Nome: ${pokemon.name}',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Habilidades:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    ...pokemon.abilities
                        .map((ability) => Text(ability))
                        .toList(),
                  ],
                );
              }

              return Container();
            }),
          ],
        ),
      ),
    );
  }
}
