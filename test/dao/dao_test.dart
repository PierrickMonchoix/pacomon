import 'package:first_flutter_app/dao/dao.dart';
import 'package:first_flutter_app/dao/xls_elements/carte_sheet/elements_primaires/id_element_terrain_xls.dart';
import 'package:first_flutter_app/dao/xls_elements/liste_element_terrain_sheet/elements_primaires/elements_terrain_xls.dart';
import 'package:first_flutter_app/modele/carte.dart';
import 'package:first_flutter_app/modele/element_terrain.dart';
import 'package:first_flutter_app/modele/liste_pokemon.dart';
import 'package:first_flutter_app/modele/pokemon.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  testWidgets('getCarteFromXlsPath', (tester) async {
    Carte carte = await Dao.getCarteFromXlsPath( xlsPath: "assets/for_tests/database_test.xlsx");
    ElementTerrain herbe = ElementTerrain(nom: "HERBE" , pathImage: "path_herbe" , traversable: true , probaPokemon: 0.60);
    ElementTerrain sol = ElementTerrain(nom: "SOL" , pathImage: "path_sol" , traversable: true , probaPokemon: 0.0);
    ElementTerrain rocher = ElementTerrain(nom: "ROCHER" , pathImage: "path_rocher" , traversable: false , probaPokemon: 0.0);

    expect(carte.getElementTerrainFromCoord(y: 0 , x: 0) , herbe);
    expect(carte.getElementTerrainFromCoord(y: 1 , x: 0) , sol);
    expect(carte.getElementTerrainFromCoord(y: 1 , x: 2) , rocher);
  });

  testWidgets('getListePokemonFromXlsPath', (tester) async {
      ListePokemon listePokemon= await Dao.getListePokemonFromXlsPath(xlsPath: "assets/for_tests/database_test.xlsx");
      Pokemon pikachu = Pokemon(nom: "Pikachu", pathImage: "path_pikachu", rarete: 0.667);
      Pokemon mewtwo = Pokemon(nom: "Mewtwo", pathImage: "path_mewtwo", rarete: 0.333);

      expect(listePokemon.getPokemonFromNom("Pikachu"), pikachu);
      expect(listePokemon.getPokemonFromNom("Mewtwo"), mewtwo);
    }); 
}
