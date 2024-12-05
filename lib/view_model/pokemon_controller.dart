import 'package:get/get.dart';
import '../model/pokemon.dart';
import '../service/pokemon_service.dart';

class PokemonController extends GetxController {
  final PokemonService _service = PokemonService();

  // Estado do Pokémon
  var pokemon = Rxn<Pokemon>();
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  void searchPokemon(String name) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      final result = await _service.fetchPokemon(name.toLowerCase().trim());
      pokemon.value = result;
    } catch (e) {
      errorMessage.value = e.toString();
      pokemon.value = null;
    } finally {
      isLoading.value = false;
    }
  }
}
