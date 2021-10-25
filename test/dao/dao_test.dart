import 'package:first_flutter_app/dao/dao.dart';
import 'package:first_flutter_app/dao/xls_elements/carte_sheet/elements_primaires/id_element_terrain_xls.dart';
import 'package:first_flutter_app/dao/xls_elements/liste_element_terrain_sheet/elements_primaires/elements_terrain_xls.dart';
import 'package:first_flutter_app/modele/carte.dart';
import 'package:first_flutter_app/modele/element_terrain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  testWidgets('getCarteFromXlsPath', (tester) async {
    Carte carte = await Dao.getCarteFromXlsPath( xlsPath: "assets/for_tests/database_test.xlsx");
    ElementTerrain herbe = ElementTerrain(nom: "HERBE" , pathImage: "path_herbe" , traversable: true);
    ElementTerrain sol = ElementTerrain(nom: "SOL" , pathImage: "path_sol" , traversable: true);
    ElementTerrain rocher = ElementTerrain(nom: "ROCHER" , pathImage: "path_rocher" , traversable: false);

    expect(carte.getElementTerrainFromCoord(y: 0 , x: 0) , herbe);
    expect(carte.getElementTerrainFromCoord(y: 1 , x: 0) , sol);
    expect(carte.getElementTerrainFromCoord(y: 1 , x: 2) , rocher);
  });
}
