import 'package:first_flutter_app/dao/dao.dart';
import 'package:first_flutter_app/modele/liste_pokemon.dart';
import 'package:first_flutter_app/modele/pokemon.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('pokemon get random', (tester) async {
    Pokemon salameche = Pokemon(nom: "Salameche", pathImage: "path_salameche", rarete: 0.8);
    Pokemon reptincel = Pokemon(nom: "Reptincel", pathImage: "path_reptincel", rarete: 0.2);
    List<Pokemon> listPokemon = [salameche , reptincel];
    ListePokemon listePokemon = ListePokemon(listPokemon: listPokemon);
    Pokemon pokemonChoisi = listePokemon.getRandomPokemon()!;

    expect(pokemonChoisi == salameche || pokemonChoisi == reptincel , true);
  });

  testWidgets('get random pkmn from database', (tester) async {
    ListePokemon listePokemon = await Dao.getListePokemonFromXlsPath(xlsPath: "assets/for_tests/database_test.xlsx");
    Pokemon pokemonChoisi = listePokemon.getRandomPokemon()!;

    Pokemon pikachu = Pokemon(nom: "Pikachu", pathImage: "path_pikachu", rarete: 0.667);
    Pokemon mewtwo = Pokemon(nom: "Mewtwo", pathImage: "path_mewtwo", rarete: 0.333);

    expect(pokemonChoisi == pikachu || pokemonChoisi == mewtwo , true);
  });

}