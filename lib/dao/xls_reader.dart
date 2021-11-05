import 'package:pacomon/dao/xls_elements/carte_sheet/elements_primaires/id_element_terrain_xls.dart';
import 'package:pacomon/dao/xls_elements/carte_sheet/sheet/carte_xls_sheet.dart';
import 'package:pacomon/dao/xls_elements/liste_element_terrain_sheet/elements_primaires/elements_terrain_xls.dart';
import 'package:pacomon/dao/xls_elements/liste_element_terrain_sheet/sheet/liste_element_terrain_xls_sheet.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:excel/excel.dart';
import 'package:pacomon/dao/xls_elements/liste_pokemon_sheet/elements_primaires/pokemon_xls.dart';
import 'package:pacomon/dao/xls_elements/liste_pokemon_sheet/sheet/liste_pokemon_xls_sheet.dart';
import 'package:pacomon/modele/carte.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;

class XlsReader {
  static Future<String> getTailleXCarteModeleXls(
      {required String xlsPath}) async {
    ByteData data = await rootBundle.load(xlsPath);
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);
    return excel["carte"].maxCols.toString();
  }

  static Future<String> getTailleYCarteModeleXls(
      {required String xlsPath}) async {
    ByteData data = await rootBundle.load(xlsPath);
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);
    return excel["carte"].maxRows.toString();
  }

  static Future<String> getTailleCarteVueXls({required String xlsPath}) async {
    ByteData data = await rootBundle.load(xlsPath);
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);
    return excel["donnees"]
        .cell(CellIndex.indexByString("B1"))
        .value
        .toString();
  }

  static Future<String> getXSpawnHeroXls({required String xlsPath}) async {
    ByteData data = await rootBundle.load(xlsPath);
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);
    return excel["donnees"]
        .cell(CellIndex.indexByString("B2"))
        .value
        .toString();
  }

  static Future<String> getYSpawnHeroXls({required String xlsPath}) async {
    ByteData data = await rootBundle.load(xlsPath);
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);
    return excel["donnees"]
        .cell(CellIndex.indexByString("B3"))
        .value
        .toString();
  }

    static Future<String> getAtkBaseHeroXls({required String xlsPath}) async {
    ByteData data = await rootBundle.load(xlsPath);
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);
    return excel["donnees"]
        .cell(CellIndex.indexByString("B4"))
        .value
        .toString();
  }

      static Future<String> getDefBaseHeroXls({required String xlsPath}) async {
    ByteData data = await rootBundle.load(xlsPath);
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);
    return excel["donnees"]
        .cell(CellIndex.indexByString("B5"))
        .value
        .toString();
  }

        static Future<String> getPvBaseHeroXls({required String xlsPath}) async {
    ByteData data = await rootBundle.load(xlsPath);
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);
    return excel["donnees"]
        .cell(CellIndex.indexByString("B6"))
        .value
        .toString();
  }

          static Future<String> getAugmentationStatsParLevelHeroXls({required String xlsPath}) async {
    ByteData data = await rootBundle.load(xlsPath);
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);
    return excel["donnees"]
        .cell(CellIndex.indexByString("B7"))
        .value
        .toString();
  }



  static Future<CarteXlsSheet> getCarteXls({required String xlsPath}) async {
    ByteData data = await rootBundle.load(xlsPath);
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);

    int tailleXCarte =
        int.parse(await getTailleXCarteModeleXls(xlsPath: xlsPath));
    int tailleYCarte =
        int.parse(await getTailleYCarteModeleXls(xlsPath: xlsPath));

    List<List<IdElementTerrainXls>> matrice =
        List.generate(tailleYCarte, (i) => List.empty(growable: true));

    for (var i = 0; i < tailleYCarte; i++) {
      for (var j = 0; j < tailleXCarte; j++) {
        String id =
            excel[CarteXlsSheet.nomSheet]!.row(i).toList()[j].value.toString();
        matrice[i].add(IdElementTerrainXls(id: id));
      }
    }

    CarteXlsSheet returnedCarteX = CarteXlsSheet(matrice);

    return returnedCarteX;
  }

  static Future<ListElementTerrainXlsSheet> getListElementTerrainXlsSheet(
      {required String xlsPath}) async {
    ByteData data = await rootBundle.load(xlsPath);
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);

    List<ElementTerrainXls> listElement = [];

    int maxElement = excel[ListElementTerrainXlsSheet.nomSheet]!.maxRows - 1;

    for (var iElem = 1; iElem <= maxElement; iElem++) {
      //premier element: titre et exemple
      String elementNom = excel[ListElementTerrainXlsSheet.nomSheet]!
          .row(iElem)
          .toList()[ListElementTerrainXlsSheet.getSheetColonne(
              CaracteristiqueElementTerrainXls.idElement)]
          .value
          .toString();
      String elementCheminImage = excel[ListElementTerrainXlsSheet.nomSheet]!
          .row(iElem)
          .toList()[ListElementTerrainXlsSheet.getSheetColonne(
              CaracteristiqueElementTerrainXls.cheminImage)]
          .value
          .toString();
      String elementTraversable = excel[ListElementTerrainXlsSheet.nomSheet]!
          .row(iElem)
          .toList()[ListElementTerrainXlsSheet.getSheetColonne(
              CaracteristiqueElementTerrainXls.traversable)]
          .value
          .toString();
      String elementProbaPacomon = excel[ListElementTerrainXlsSheet.nomSheet]!
          .row(iElem)
          .toList()[ListElementTerrainXlsSheet.getSheetColonne(
              CaracteristiqueElementTerrainXls.probaPacomon)]
          .value
          .toString();
      String elementCategorie = excel[ListElementTerrainXlsSheet.nomSheet]!
          .row(iElem)
          .toList()[ListElementTerrainXlsSheet.getSheetColonne(
              CaracteristiqueElementTerrainXls.categorie)]
          .value
          .toString();

      listElement.add(ElementTerrainXls(
          id: elementNom,
          pathImage: elementCheminImage,
          traversable: elementTraversable,
          probaPacomon: elementProbaPacomon,
          categorie: elementCategorie));
    }
    return ListElementTerrainXlsSheet(listElement);
  }

  static Future<ListePacomonXlsSheet> getListePacomonXlsSheet(
      {required String xlsPath}) async {
    ByteData data = await rootBundle.load(xlsPath);
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);

    List<PacomonXls> listPacomon = [];

    int maxPacomon = excel[ListePacomonXlsSheet.nomSheet]!.maxRows - 1;

    for (var iPkmn = 1; iPkmn <= maxPacomon; iPkmn++) {
      //premier element: titre et exemple
      String nom = excel[ListePacomonXlsSheet.nomSheet]!
          .row(iPkmn)
          .toList()[ListePacomonXlsSheet.getSheetColonne(
              CaracteristiquePacomonXls.nom)]
          .value
          .toString();
      String cheminImage = excel[ListePacomonXlsSheet.nomSheet]!
          .row(iPkmn)
          .toList()[ListePacomonXlsSheet.getSheetColonne(
              CaracteristiquePacomonXls.cheminImage)]
          .value
          .toString();
      String rarete = excel[ListePacomonXlsSheet.nomSheet]!
          .row(iPkmn)
          .toList()[ListePacomonXlsSheet.getSheetColonne(
              CaracteristiquePacomonXls.rarete)]
          .value
          .toString();
      String atk = excel[ListePacomonXlsSheet.nomSheet]!
          .row(iPkmn)
          .toList()[ListePacomonXlsSheet.getSheetColonne(
              CaracteristiquePacomonXls.atk)]
          .value
          .toString();
      String def = excel[ListePacomonXlsSheet.nomSheet]!
          .row(iPkmn)
          .toList()[ListePacomonXlsSheet.getSheetColonne(
              CaracteristiquePacomonXls.def)]
          .value
          .toString();
      String pvMax = excel[ListePacomonXlsSheet.nomSheet]!
          .row(iPkmn)
          .toList()[ListePacomonXlsSheet.getSheetColonne(
              CaracteristiquePacomonXls.pvMax)]
          .value
          .toString();
      String categorie = excel[ListePacomonXlsSheet.nomSheet]!
          .row(iPkmn)
          .toList()[ListePacomonXlsSheet.getSheetColonne(
              CaracteristiquePacomonXls.categorie)]
          .value
          .toString();
      listPacomon.add(PacomonXls(
          nom: nom,
          pathImage: cheminImage,
          rarete: rarete,
          atk: atk,
          def: def,
          pvMax: pvMax,
          categorie: categorie));
    }
    return ListePacomonXlsSheet(listPacomon);
  }
}
