import 'package:first_flutter_app/dao/dao.dart';
import 'package:first_flutter_app/dao/xls_elements/liste_element_terrain_sheet/elements_primaires/elements_terrain_xls.dart';
import 'package:first_flutter_app/modele/element_terrain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('elementTerrainFromXls', (tester) async {
    ElementTerrainXls elementTerrainXls = ElementTerrainXls(id: "HERBE" , pathImage: "path_herbe" , traversable: "OUI");
    ElementTerrain elementTerrainFromDao = Dao.elementTerrainFromXls(elementTerrainXls);
    ElementTerrain elementTerrainMatcher = ElementTerrain();
    elementTerrainMatcher.nom ="HERBE";
    elementTerrainMatcher.pathImage="path_herbe";
    elementTerrainMatcher.traversable = true;
    expect(elementTerrainFromDao, elementTerrainMatcher);
    

  }, tags: "test_it");
}