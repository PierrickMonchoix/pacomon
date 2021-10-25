import 'package:first_flutter_app/dao/dao.dart';
import 'package:first_flutter_app/dao/xls_elements/carte_sheet/elements_primaires/id_element_terrain_xls.dart';
import 'package:first_flutter_app/dao/xls_elements/liste_element_terrain_sheet/elements_primaires/elements_terrain_xls.dart';
import 'package:first_flutter_app/modele/carte.dart';
import 'package:first_flutter_app/modele/element_terrain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('setElementTerrainFromElementTerrainXls', (tester) async {
    ElementTerrainXls elementTerrainXls = ElementTerrainXls(
        id: "HERBE", pathImage: "path_herbe", traversable: "OUI");
    ElementTerrain elementTerrainFromDao = ElementTerrain.vide();
    Dao.setElementTerrainFromElementTerrainXls(
        elementTerrain: elementTerrainFromDao,
        elementTerrainXls: elementTerrainXls);
    ElementTerrain elementTerrainMatcher = ElementTerrain.vide();
    elementTerrainMatcher.setAll(
        nom: "HERBE", traversable: true, pathImage: "path_herbe");
    expect(elementTerrainFromDao, elementTerrainMatcher);
  });

  testWidgets('getElementTerrainXlsFromElementTerrainIdXls', (tester) async {
     IdElementTerrainXls idElementTerrainXls = IdElementTerrainXls(id: "HERBE");
     ElementTerrainXls elementTerrainXlsFromId =
        await Dao.getElementTerrainXlsFromElementTerrainIdXls(
            idElementTerrainXls: idElementTerrainXls ,xlsPath: "assets/for_tests/database_test.xlsx");  

     ElementTerrainXls elementTerrainXlsMatcher = ElementTerrainXls(id: "HERBE" , traversable: "OUI" , pathImage: "path_herbe");
    expect(elementTerrainXlsFromId,elementTerrainXlsMatcher);
  });


  testWidgets('getCarte', (tester) async {
    Carte carte = Carte();
    await Dao.setCarte(carte : carte , xlsPath: "assets/for_tests/database_test.xlsx");
    ElementTerrain herbe = ElementTerrain(nom: "HERBE" , pathImage: "path_herbe" , traversable: true);
    ElementTerrain sol = ElementTerrain(nom: "SOL" , pathImage: "path_sol" , traversable: true);
    ElementTerrain rocher = ElementTerrain(nom: "ROCHER" , pathImage: "path_rocher" , traversable: false);

    expect(carte.getElementTerrainFromCoord(y: 0 , x: 0) , herbe);
    expect(carte.getElementTerrainFromCoord(y: 1 , x: 0) , sol);
    expect(carte.getElementTerrainFromCoord(y: 1 , x: 2) , rocher);
  });
}
