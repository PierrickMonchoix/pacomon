import 'package:first_flutter_app/dao/dao.dart';
import 'package:first_flutter_app/dao/xls_elements/carte_sheet/elements_primaires/id_element_terrain_xls.dart';
import 'package:first_flutter_app/dao/xls_elements/liste_element_terrain_sheet/elements_primaires/elements_terrain_xls.dart';
import 'package:first_flutter_app/modele/element_terrain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('elementTerrainFromXls', (tester) async {
    ElementTerrainXls elementTerrainXls = ElementTerrainXls(
        id: "HERBE", pathImage: "path_herbe", traversable: "OUI");
    ElementTerrain elementTerrainFromDao = ElementTerrain.vide();
    Dao.setElementTerrainFromXls(
        elementTerrain: elementTerrainFromDao,
        elementTerrainXls: elementTerrainXls);
    ElementTerrain elementTerrainMatcher = ElementTerrain.vide();
    elementTerrainMatcher.setAll(
        nom: "HERBE", traversable: true, pathImage: "path_herbe");
    expect(elementTerrainFromDao, elementTerrainMatcher);
  });

  testWidgets('getElementTerrainFromId', (tester) async {
     IdElementTerrainXls idElementTerrainXls = IdElementTerrainXls(id: "HERBE");
     ElementTerrainXls elementTerrainXlsFromId =
        await Dao.getElementTerrainFromId(
            idElementTerrainXls: idElementTerrainXls);  

     ElementTerrainXls elementTerrainXlsMatcher = ElementTerrainXls(id: "HERBE" , traversable: "OUI" , pathImage: "path_herbe");
    expect(elementTerrainXlsFromId,elementTerrainXlsMatcher);
  });
}
