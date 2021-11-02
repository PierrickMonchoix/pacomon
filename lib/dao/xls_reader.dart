import 'package:first_flutter_app/dao/xls_elements/carte_sheet/elements_primaires/id_element_terrain_xls.dart';
import 'package:first_flutter_app/dao/xls_elements/carte_sheet/sheet/carte_xls_sheet.dart';
import 'package:first_flutter_app/dao/xls_elements/liste_element_terrain_sheet/elements_primaires/elements_terrain_xls.dart';
import 'package:first_flutter_app/dao/xls_elements/liste_element_terrain_sheet/sheet/liste_element_terrain_xls_sheet.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:excel/excel.dart';
import 'package:first_flutter_app/dao/xls_elements/liste_pokemon_sheet/elements_primaires/pokemon_xls.dart';
import 'package:first_flutter_app/dao/xls_elements/liste_pokemon_sheet/sheet/liste_pokemon_xls_sheet.dart';
import 'package:first_flutter_app/modele/carte.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;

class XlsReader {
  static Future<String> getTailleCarteModeleXls(
      {required String xlsPath}) async {
    ByteData data = await rootBundle.load(xlsPath);
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);
    return excel["carte"].maxCols.toString();
  }

  static Future<String> getTailleCarteVueXls(
      {required String xlsPath}) async {
    ByteData data = await rootBundle.load(xlsPath);
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);
    return excel["donnees"]
        .cell(CellIndex.indexByString("B1"))
        .value
        .toString();
  }

  static Future<String> getXSpawnHeroXls(
      {required String xlsPath}) async {
    ByteData data = await rootBundle.load(xlsPath);
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);
    return excel["donnees"]
        .cell(CellIndex.indexByString("B2"))
        .value
        .toString();
  }

  static Future<String> getYSpawnHeroXls(
      {required String xlsPath}) async {
    ByteData data = await rootBundle.load(xlsPath);
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);
    return excel["donnees"]
        .cell(CellIndex.indexByString("B3"))
        .value
        .toString();
  }

  static Future<CarteXlsSheet> getCarteXls({required String xlsPath}) async {
    ByteData data = await rootBundle.load(xlsPath);
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);

    int tailleCarte = int.parse( await getTailleCarteModeleXls(xlsPath: xlsPath) );

    List<List<IdElementTerrainXls>> matrice =
        List.generate(tailleCarte, (i) => List.empty(growable: true));

    for (var i = 0; i < tailleCarte; i++) {
      for (var j = 0; j < tailleCarte; j++) {
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

    int maxElement = excel[ListElementTerrainXlsSheet.nomSheet]!.maxCols - 1;

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
      String elementProbaPokemon = excel[ListElementTerrainXlsSheet.nomSheet]!
          .row(iElem)
          .toList()[ListElementTerrainXlsSheet.getSheetColonne(
              CaracteristiqueElementTerrainXls.probaPokemon)]
          .value
          .toString();
      listElement.add(ElementTerrainXls(
          id: elementNom,
          pathImage: elementCheminImage,
          traversable: elementTraversable,
          probaPokemon: elementProbaPokemon));
    }
    return ListElementTerrainXlsSheet(listElement);
  }

  static Future<ListePokemonXlsSheet> getListePokemonXlsSheet(
      {required String xlsPath}) async {
    ByteData data = await rootBundle.load(xlsPath);
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);

    List<PokemonXls> listPokemon = [];

    int maxPokemon = excel[ListePokemonXlsSheet.nomSheet]!.maxCols - 1;

    for (var iPkmn = 1; iPkmn <= maxPokemon; iPkmn++) {
      //premier element: titre et exemple
      String nom = excel[ListePokemonXlsSheet.nomSheet]!
          .row(iPkmn)
          .toList()[ListePokemonXlsSheet.getSheetColonne(
              CaracteristiquePokemonXls.nom)]
          .value
          .toString();
      String cheminImage = excel[ListePokemonXlsSheet.nomSheet]!
          .row(iPkmn)
          .toList()[ListePokemonXlsSheet.getSheetColonne(
              CaracteristiquePokemonXls.cheminImage)]
          .value
          .toString();
      String rarete = excel[ListePokemonXlsSheet.nomSheet]!
          .row(iPkmn)
          .toList()[ListePokemonXlsSheet.getSheetColonne(
              CaracteristiquePokemonXls.rarete)]
          .value
          .toString();
      listPokemon
          .add(PokemonXls(nom: nom, pathImage: cheminImage, rarete: rarete));
    }
    return ListePokemonXlsSheet(listPokemon);
  }
}
