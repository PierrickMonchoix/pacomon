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
  static Future<CarteXlsSheet> getCarteXls({required String xlsPath}) async {
    ByteData data = await rootBundle.load(xlsPath);
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);

    List<List<IdElementTerrainXls>> matrice =
        List.generate(Carte.taille, (i) => List.empty(growable: true));

    for (var i = 0; i < Carte.taille; i++) {
      for (var j = 0; j < Carte.taille; j++) {
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

    int maxElement =
        excel[ListElementTerrainXlsSheet.nomSheet]!.row(0).toList().length;

    for (var iElem = 1; iElem < maxElement; iElem++) {
      //premier element: titre et exemple
      String elementNom = excel[ListElementTerrainXlsSheet.nomSheet]!
          .row(ListElementTerrainXlsSheet.getSheetColonne(
              CaracteristiqueElementTerrainXls.idElement))
          .toList()[iElem]
          .value
          .toString();
      String elementCheminImage = excel[ListElementTerrainXlsSheet.nomSheet]!
          .row(ListElementTerrainXlsSheet.getSheetColonne(
              CaracteristiqueElementTerrainXls.cheminImage))
          .toList()[iElem]
          .value
          .toString();
      String elementTraversable = excel[ListElementTerrainXlsSheet.nomSheet]!
          .row(ListElementTerrainXlsSheet.getSheetColonne(
              CaracteristiqueElementTerrainXls.traversable))
          .toList()[iElem]
          .value
          .toString();
      String elementProbaPokemon = excel[ListElementTerrainXlsSheet.nomSheet]!
          .row(ListElementTerrainXlsSheet.getSheetColonne(
              CaracteristiqueElementTerrainXls.probaPokemon))
          .toList()[iElem]
          .value
          .toString();
      listElement.add(ElementTerrainXls(
          id: elementNom,
          pathImage: elementCheminImage,
          traversable: elementTraversable,
          probaPokemon: elementProbaPokemon
          ));
    }
    return ListElementTerrainXlsSheet(listElement);
  }

  static Future<ListePokemonXlsSheet> getListePokemonXlsSheet(
      {required String xlsPath}) async {
    ByteData data = await rootBundle.load(xlsPath);
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);

    List<PokemonXls> listPokemon = [];

    int maxPokemon =
        excel[ListePokemonXlsSheet.nomSheet]!.row(0).toList().length;

    for (var iPkmn = 1; iPkmn < maxPokemon; iPkmn++) {
      //premier element: titre et exemple
      String nom = excel[ListePokemonXlsSheet.nomSheet]!
          .row(ListePokemonXlsSheet.getSheetColonne(
              CaracteristiquePokemonXls.nom))
          .toList()[iPkmn]
          .value
          .toString();
      String cheminImage = excel[ListePokemonXlsSheet.nomSheet]!
          .row(ListePokemonXlsSheet.getSheetColonne(
              CaracteristiquePokemonXls.cheminImage))
          .toList()[iPkmn]
          .value
          .toString();
      String rarete = excel[ListePokemonXlsSheet.nomSheet]!
          .row(ListePokemonXlsSheet.getSheetColonne(
              CaracteristiquePokemonXls.rarete))
          .toList()[iPkmn]
          .value
          .toString();
      listPokemon.add(PokemonXls(
          nom: nom,
          pathImage: cheminImage,
          rarete: rarete));
    }
    return ListePokemonXlsSheet(listPokemon);
  }
}
