import 'package:pacomon/dao/xls_elements/carte_sheet/elements_primaires/id_element_terrain_xls.dart';
import 'package:pacomon/dao/xls_elements/carte_sheet/sheet/carte_xls_sheet.dart';
import 'package:pacomon/dao/xls_elements/liste_element_terrain_sheet/elements_primaires/elements_terrain_xls.dart';
import 'package:pacomon/dao/xls_elements/liste_element_terrain_sheet/sheet/liste_element_terrain_xls_sheet.dart';
import 'package:pacomon/dao/xls_elements/liste_pokemon_sheet/elements_primaires/pokemon_xls.dart';
import 'package:pacomon/dao/xls_elements/liste_pokemon_sheet/sheet/liste_pokemon_xls_sheet.dart';
import 'package:pacomon/dao/xls_reader.dart';
import 'package:pacomon/modele/carte.dart';
import 'package:pacomon/modele/element_terrain.dart';
import 'package:pacomon/modele/liste_pokemon.dart';
import 'package:pacomon/modele/pacomon.dart';

class Dao {
  //"assets/for_tests/database_test.xlsx"

  static Map<String, ListElementTerrainXlsSheet>
      _listElementTerrainXlsSheetMap = {};

  static Future<ListElementTerrainXlsSheet>
      _getListElementTerrainXlsSheetInstance({required String xlsPath}) async {
    if (_listElementTerrainXlsSheetMap.containsKey(xlsPath)) {
      return _listElementTerrainXlsSheetMap[xlsPath]!;
    }
    _listElementTerrainXlsSheetMap[xlsPath] =
        await XlsReader.getListElementTerrainXlsSheet(xlsPath: xlsPath);
    return _listElementTerrainXlsSheetMap[xlsPath]!;
  }

  static Future<ElementTerrainXls> _getElementTerrainXlsFromElementTerrainIdXls(
      {required IdElementTerrainXls idElementTerrainXls,
      required String xlsPath}) async {
    ListElementTerrainXlsSheet listElementXls =
        await _getListElementTerrainXlsSheetInstance(xlsPath: xlsPath);
    try {
      return listElementXls.list
          .firstWhere((element) => element.id == idElementTerrainXls.id);
    } catch (e) {
      print("@@@@@@@@@@@@@@@@ RAPPORT D'ERREUR @@@@@@@@@@@@@@@@\n\n");
      print(
          "Un element de terrain de la carte n'a pas ete trouve dans la liste des elements de terrain.\n");
      print("Liste de tous les elements de terrain: " +
          listElementXls.toString());
      print("\n");
      print("Element qui cause le crash: " + idElementTerrainXls.toString());
      print("\n");
      print("@@@@@@@@@@@@@@@@ FIN RAPPORT D'ERREUR @@@@@@@@@@@@@@@@\n");
      throw e;
    }
  }

  static ElementTerrain _getElementTerrainFromElementTerrainXls(
      {required ElementTerrainXls elementTerrainXls}) {
    try {
      ElementTerrain elementTerrain = ElementTerrain(
          nom: elementTerrainXls.id,
          traversable: elementTerrainXls.traversable == "OUI" ? true : false,
          pathImage: elementTerrainXls.pathImage,
          probaPacomon: double.parse(elementTerrainXls.probaPacomon) / 100,
          categorie: elementTerrainXls.categorie);
      return elementTerrain;
    } catch (e) {
      print("@@@@@@@@@@@@@@@@ RAPPORT D'ERREUR @@@@@@@@@@@@@@@@\n\n");
      print("Un element de terrain a ete mal rempli\n");
      print("Element qui cause le crash: " + elementTerrainXls.toString());
      print("\n");
      print("@@@@@@@@@@@@@@@@ FIN RAPPORT D'ERREUR @@@@@@@@@@@@@@@@\n");
      throw e;
    }
  }

  static Pacomon _getPacomonFromPacomonXls({required PacomonXls pacomonXls}) {
    try {
      Pacomon pacomon = Pacomon(
          pv: int.parse(pacomonXls.pvMax),
          atk: int.parse(pacomonXls.atk),
          def: int.parse(pacomonXls.def),
          nom: pacomonXls.nom,
          pathImage: pacomonXls.pathImage,
          rarete: double.parse(pacomonXls.rarete) / 100,
          categorie: pacomonXls.categorie);
      return pacomon;
    } catch (e) {
      print("@@@@@@@@@@@@@@@@ RAPPORT D'ERREUR @@@@@@@@@@@@@@@@\n\n");
      print("Un pacomon a ete mal rempli\n");
      print("Pacomon qui cause le crash: " + pacomonXls.toString());
      print("\n");
      print("@@@@@@@@@@@@@@@@ FIN RAPPORT D'ERREUR @@@@@@@@@@@@@@@@\n");
      throw e;
    }
  }

  //PUBLIC :

  static Future<int> getTailleXCarteModele({required String xlsPath}) async {
    return int.parse(
        await XlsReader.getTailleXCarteModeleXls(xlsPath: xlsPath));
  }

  static Future<int> getTailleYCarteModele({required String xlsPath}) async {
    return int.parse(
        await XlsReader.getTailleYCarteModeleXls(xlsPath: xlsPath));
  }

  static Future<int> getTailleCarteVue({required String xlsPath}) async {
    return int.parse(await XlsReader.getTailleCarteVueXls(xlsPath: xlsPath));
  }

  static Future<int> getXSpawnHero({required String xlsPath}) async {
    return int.parse(await XlsReader.getXSpawnHeroXls(xlsPath: xlsPath));
  }

  static Future<int> getYSpawnHero({required String xlsPath}) async {
    return int.parse(await XlsReader.getYSpawnHeroXls(xlsPath: xlsPath));
  }

  static Future<Carte> getCarteFromXlsPath({required String xlsPath}) async {
    CarteXlsSheet carteXls = await XlsReader.getCarteXls(xlsPath: xlsPath);
    Carte.tailleX = await getTailleXCarteModele(xlsPath: xlsPath);
    Carte.tailleY = await getTailleYCarteModele(xlsPath: xlsPath);

    List<List<ElementTerrain>> matriceElementTerrain = List.generate(
        Carte.tailleY,
        (i) => List.generate(Carte.tailleX, (j) => ElementTerrain.vide()));

    for (int i = 0; i < Carte.tailleY; i++) {
      for (int j = 0; j < Carte.tailleX; j++) {
        ElementTerrain elementTerrain = _getElementTerrainFromElementTerrainXls(
            elementTerrainXls:
                await _getElementTerrainXlsFromElementTerrainIdXls(
                    idElementTerrainXls: carteXls.matrice[i][j],
                    xlsPath: xlsPath));
        matriceElementTerrain[i][j] = elementTerrain;
      }
    }
    Carte carte = Carte(matriceElementTerrain: matriceElementTerrain);
    return carte;
  }

  static Future<ListePacomon> getListePacomonFromXlsPath(
      {required String xlsPath}) async {
    ListePacomonXlsSheet listePacomonXlsSheet =
        await XlsReader.getListePacomonXlsSheet(xlsPath: xlsPath);
    List<Pacomon> listPacomon = [];

    for (PacomonXls pacomonXls in listePacomonXlsSheet.list) {
      Pacomon newPacomon = _getPacomonFromPacomonXls(pacomonXls: pacomonXls);
      listPacomon.add(newPacomon);
    }
    return ListePacomon(listPacomon: listPacomon);
  }
}
