import 'package:pacomon/dao/dao.dart';
import 'package:pacomon/dao/xls_elements/carte_sheet/elements_primaires/id_element_terrain_xls.dart';
import 'package:pacomon/dao/xls_elements/liste_element_terrain_sheet/elements_primaires/elements_terrain_xls.dart';
import 'package:pacomon/modele/carte.dart';
import 'package:pacomon/modele/element_terrain.dart';
import 'package:pacomon/modele/liste_pokemon.dart';
import 'package:pacomon/modele/pacomon.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  testWidgets('getCarteFromXlsPath', (tester) async {
    Carte carte = await Dao.getCarteFromXlsPath( xlsPath: "assets/for_tests/database_test.xlsx");
    ElementTerrain herbe = ElementTerrain(nom: "HERBE" , pathImage: "path_herbe" , traversable: true , probaPacomon: 0.60 ,categorie: "DEBUT");
    ElementTerrain sol = ElementTerrain(nom: "SOL" , pathImage: "path_sol" , traversable: true , probaPacomon: 0.0 ,categorie: "DEBUT");
    ElementTerrain rocher = ElementTerrain(nom: "ROCHER" , pathImage: "path_rocher" , traversable: false , probaPacomon: 0.0 ,categorie: "DEBUT");

    expect(Carte.tailleX, 11);
    expect(Carte.tailleY, 14);

    expect(carte.getElementTerrainFromCoord(y: 0 , x: 0) , herbe);
    expect(carte.getElementTerrainFromCoord(y: 1 , x: 0) , sol);
    expect(carte.getElementTerrainFromCoord(y: 1 , x: 2) , rocher);
  });

  testWidgets('getListePokemonFromXlsPath', (tester) async {
      ListePacomon listePokemon= await Dao.getListePacomonFromXlsPath(xlsPath: "assets/for_tests/database_test.xlsx");
      Pacomon pikachu = Pacomon(nom: "Pikachu", pathImage: "path_pikachu", rarete: 0.667, atk: 2, def: 0, pv: 20 ,categorie: "DEBUT" , exp: 10);
      Pacomon mewtwo = Pacomon(nom: "Mewtwo", pathImage: "path_mewtwo", rarete: 0.333, atk: 20, def: 100, pv: 200 ,categorie: "DEBUT" , exp : 10);
      Pacomon dracofeu = Pacomon(nom: "Dracofeu", pathImage: "path_dracofeu", rarete: 1.0, atk: 200, def: 200, pv: 2000 ,categorie: "HARD" , exp : 100);

      expect(listePokemon.getPacomonFromNom("Pikachu"), pikachu);
      expect(listePokemon.getPacomonFromNom("Mewtwo"), mewtwo);
      expect(listePokemon.getPacomonFromNom("Dracofeu"), dracofeu);
    }); 
}
