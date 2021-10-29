import 'package:first_flutter_app/dao/xls_elements/carte_sheet/elements_primaires/id_element_terrain_xls.dart';
import 'package:first_flutter_app/dao/xls_elements/carte_sheet/sheet/carte_xls_sheet.dart';
import 'package:first_flutter_app/dao/xls_elements/liste_element_terrain_sheet/elements_primaires/elements_terrain_xls.dart';
import 'package:first_flutter_app/dao/xls_elements/liste_element_terrain_sheet/sheet/liste_element_terrain_xls_sheet.dart';
import 'package:first_flutter_app/dao/xls_elements/liste_pokemon_sheet/elements_primaires/pokemon_xls.dart';
import 'package:first_flutter_app/dao/xls_elements/liste_pokemon_sheet/sheet/liste_pokemon_xls_sheet.dart';
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

    ListElementTerrainXlsSheet listElementTerrain = await XlsReader.getListElementTerrainXlsSheet(xlsPath: "assets/for_tests/database_test.xlsx");

    ElementTerrainXls herbe = ElementTerrainXls(id: "HERBE" , pathImage: "path_herbe" , traversable: "OUI" , probaPokemon: "60");
    ElementTerrainXls sol = ElementTerrainXls(id: "SOL" , pathImage: "path_sol" , traversable: "OUI" , probaPokemon: "0");
    ElementTerrainXls rocher = ElementTerrainXls(id: "ROCHER" , pathImage: "path_rocher" , traversable: "NON" , probaPokemon: "0");

    expect(listElementTerrain.list[0], herbe);
    expect(listElementTerrain.list[1], sol);
    expect(listElementTerrain.list[2], rocher);

  });

  testWidgets('getListPokemonXls', (tester) async {  
    ListePokemonXlsSheet listPokemonXlsSheet = await XlsReader.getListePokemonXlsSheet(xlsPath: "assets/for_tests/database_test.xlsx");

    PokemonXls pikachu = PokemonXls(nom: "Pikachu" , pathImage: "path_pikachu" , rarete: "66.7");
    PokemonXls mewtwo = PokemonXls(nom: "Mewtwo" , pathImage: "path_mewtwo" , rarete: "33.3");

    expect(listPokemonXlsSheet.list[0], pikachu);
    expect(listPokemonXlsSheet.list[1], mewtwo);
  });



}
