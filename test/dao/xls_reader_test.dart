import 'package:first_flutter_app/dao/xls_elements/carte_sheet/elements_primaires/id_element_terrain_xls.dart';
import 'package:first_flutter_app/dao/xls_elements/carte_sheet/sheet/carte_xls_sheet.dart';
import 'package:first_flutter_app/dao/xls_elements/liste_element_terrain_sheet/elements_primaires/elements_terrain_xls.dart';
import 'package:first_flutter_app/dao/xls_elements/liste_element_terrain_sheet/sheet/liste_element_terrain_xls_sheet.dart';
import 'package:first_flutter_app/dao/xls_reader.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('getCarteXls', (tester) async {
    IdElementTerrainXls sol = IdElementTerrainXls(id: "SOL");
    IdElementTerrainXls herbe = IdElementTerrainXls(id: "HERBE");
    IdElementTerrainXls rocher = IdElementTerrainXls(id: "ROCHER");

    CarteXlsSheet carteXls = await XlsReader.getCarteXls(
        xlsPath: "assets/for_tests/database_test.xlsx");

    expect(carteXls.matrice[0][0].equals(herbe), true);
    expect(carteXls.matrice[2][0].equals(rocher), true);
    expect(carteXls.matrice[2][2].equals(sol), true);
  });

  testWidgets('getListElementTerrainXls', (tester) async {

    ListElementTerrainXlsSheet listElementTerrain = await XlsReader.getListElementTerrainXls(xlsPath: "assets/for_tests/database_test.xlsx");

    ElementTerrainXls herbe = ElementTerrainXls(id: "HERBE" , pathImage: "path_herbe" , traversable: "OUI");
    ElementTerrainXls sol = ElementTerrainXls(id: "SOL" , pathImage: "path_sol" , traversable: "OUI");
    ElementTerrainXls rocher = ElementTerrainXls(id: "ROCHER" , pathImage: "path_rocher" , traversable: "NON");

    expect(listElementTerrain.list[0].equals(herbe), true);
    expect(listElementTerrain.list[1].equals(sol), true);
    expect(listElementTerrain.list[2].equals(rocher), true);

  });
}
