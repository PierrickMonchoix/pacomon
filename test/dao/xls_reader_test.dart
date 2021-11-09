import 'package:pacomon/dao/xls_elements/carte_sheet/elements_primaires/id_element_terrain_xls.dart';
import 'package:pacomon/dao/xls_elements/carte_sheet/sheet/carte_xls_sheet.dart';
import 'package:pacomon/dao/xls_elements/liste_element_terrain_sheet/elements_primaires/elements_terrain_xls.dart';
import 'package:pacomon/dao/xls_elements/liste_element_terrain_sheet/sheet/liste_element_terrain_xls_sheet.dart';
import 'package:pacomon/dao/xls_elements/liste_pokemon_sheet/elements_primaires/pokemon_xls.dart';
import 'package:pacomon/dao/xls_elements/liste_pokemon_sheet/sheet/liste_pokemon_xls_sheet.dart';
import 'package:pacomon/dao/xls_reader.dart';
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

    ElementTerrainXls herbe = ElementTerrainXls(id: "HERBE" , pathImage: "path_herbe" , traversable: "OUI" , probaPacomon: "60" ,categorie: "DEBUT" , interaction: "RIEN");
    ElementTerrainXls sol = ElementTerrainXls(id: "SOL" , pathImage: "path_sol" , traversable: "OUI" , probaPacomon: "0" , categorie: "DEBUT" , interaction: "RIEN");
    ElementTerrainXls rocher = ElementTerrainXls(id: "ROCHER" , pathImage: "path_rocher" , traversable: "NON" , probaPacomon: "0" , categorie: "DEBUT" , interaction: "RIEN");
    ElementTerrainXls hautes_herbes = ElementTerrainXls(id: "HAUTE_HERBE" , pathImage: "path_herbe" , traversable: "OUI" , probaPacomon: "50" , categorie: "HARD" , interaction: "RIEN");
    ElementTerrainXls centre_pacomon = ElementTerrainXls(id: "CENTRE" , pathImage: "path_centre" , traversable: "NON" , probaPacomon: "0" , categorie: "DEBUT" , interaction: "CENTRE_PACOMON");

    expect(listElementTerrain.list[0], herbe);
    expect(listElementTerrain.list[1], sol);
    expect(listElementTerrain.list[2], rocher);
    expect(listElementTerrain.list[3], hautes_herbes);
    expect(listElementTerrain.list[4], centre_pacomon);

  });

  testWidgets('getListPokemonXls', (tester) async {  
    ListePacomonXlsSheet listPokemonXlsSheet = await XlsReader.getListePacomonXlsSheet(xlsPath: "assets/for_tests/database_test.xlsx");

    PacomonXls pikachu = PacomonXls(nom: "Pikachu" , pathImage: "path_pikachu" , rarete: "66.7" , atk: "2" , def: "0" , pvMax: "20", categorie: "DEBUT" , exp: "10", vit: "10");
    PacomonXls mewtwo = PacomonXls(nom: "Mewtwo" , pathImage: "path_mewtwo" , rarete: "33.3" , atk: "20" , def: "100" , pvMax: "200", categorie: "DEBUT" , exp: "10", vit: "1000");
    PacomonXls dracofeu = PacomonXls(nom: "Dracofeu" , pathImage: "path_dracofeu" , rarete: "100.0" , atk: "200" , def: "200" , pvMax: "2000", categorie: "HARD" , exp : "100", vit: "10");

    expect(listPokemonXlsSheet.list[0], pikachu);
    expect(listPokemonXlsSheet.list[1], mewtwo);
    expect(listPokemonXlsSheet.list[2], dracofeu);
  });



}
