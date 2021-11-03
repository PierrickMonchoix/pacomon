import 'package:pacomon/dao/dao.dart';
import 'package:pacomon/modele/liste_pokemon.dart';
import 'package:pacomon/modele/pacomon.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('pokemon get random', (tester) async {
    Pacomon salameche = Pacomon(nom: "Salameche", pathImage: "path_salameche", rarete: 0.8, atk: 0, def: 0, pv: 0);
    Pacomon reptincel = Pacomon(nom: "Reptincel", pathImage: "path_reptincel", rarete: 0.2, atk: 0, def: 0, pv: 0);
    List<Pacomon> listPokemon = [salameche , reptincel];
    ListePacomon listePokemon = ListePacomon(listPacomon: listPokemon);
    Pacomon pokemonChoisi = listePokemon.getRandomPacomon();

    expect(pokemonChoisi == salameche || pokemonChoisi == reptincel , true);
  });

  testWidgets('get random pkmn from database', (tester) async {
    ListePacomon listePokemon = await Dao.getListePacomonFromXlsPath(xlsPath: "assets/for_tests/database_test.xlsx");
    Pacomon pokemonChoisi = listePokemon.getRandomPacomon();

    Pacomon pikachu = Pacomon(nom: "Pikachu", pathImage: "path_pikachu", rarete: 0.667, atk: 0, def: 0, pv: 0);
    Pacomon mewtwo = Pacomon(nom: "Mewtwo", pathImage: "path_mewtwo", rarete: 0.333, atk: 0, def: 0, pv: 0);

    expect(pokemonChoisi == pikachu || pokemonChoisi == mewtwo , true);
  });

}