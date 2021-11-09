import 'package:pacomon/dao/dao.dart';
import 'package:pacomon/modele/liste_pokemon.dart';
import 'package:pacomon/modele/pacomon.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('pokemon get random', (tester) async {
    Pacomon salameche = Pacomon(nom: "Salameche", pathImage: "path_salameche", rarete: 1, atk: 0, def: 0, pv: 0 , categorie: "DEBUT", exp : 10, vit: 12);
    Pacomon rien = Pacomon(nom: "rien", pathImage: "path_rien", rarete: 0, atk: 0, def: 0, pv: 0 , categorie: "DEBUT", exp : 10, vit: 12);
    Pacomon dracofeu = Pacomon(nom: "Dracofeu", pathImage: "path_dracofeu", rarete: 1, atk: 0, def: 0, pv: 0 ,categorie: "HARD", exp : 10, vit: 12);
    List<Pacomon> listPokemon = [ rien , salameche , dracofeu];
    ListePacomon listePokemon = ListePacomon(listPacomon: listPokemon);
    Pacomon pokemonChoisi = listePokemon.getRandomPacomon("DEBUT");

    expect(pokemonChoisi, salameche);

    pokemonChoisi = listePokemon.getRandomPacomon("HARD");
    expect(pokemonChoisi, dracofeu);
  });

  testWidgets('get random pkmn from database', (tester) async {
    ListePacomon listePokemon = await Dao.getListePacomonFromXlsPath(xlsPath: "assets/for_tests/database_test.xlsx");
    Pacomon pokemonChoisi = listePokemon.getRandomPacomon("DEBUT");

    Pacomon pikachu = Pacomon(nom: "Pikachu", pathImage: "path_pikachu", rarete: 0.667, atk: 2, def: 0, pv: 20 , categorie: "DEBUT" , exp : 10, vit: 10);
    Pacomon mewtwo = Pacomon(nom: "Mewtwo", pathImage: "path_mewtwo", rarete: 0.333, atk: 20, def: 100, pv: 200 , categorie: "DEBUT" , exp : 10, vit: 1000);

    expect(pokemonChoisi == pikachu || pokemonChoisi == mewtwo , true);
  });

}