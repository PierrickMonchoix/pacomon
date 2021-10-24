
import 'package:first_flutter_app/dao/xls_elements/carte_sheet/elements_primaires/id_element_terrain_xls.dart';
import 'package:first_flutter_app/dao/xls_elements/carte_sheet/sheet/carte_xls_sheet.dart';
import 'package:first_flutter_app/dao/xls_elements/liste_element_terrain_sheet/elements_primaires/elements_terrain_xls.dart';
import 'package:first_flutter_app/dao/xls_elements/liste_element_terrain_sheet/sheet/liste_element_terrain_xls_sheet.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:excel/excel.dart';
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

  static Future<ListElementTerrainXlsSheet> getListElementTerrainXls({required String xlsPath})  async {
    ByteData data = await rootBundle.load(xlsPath);
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);

    List<ElementTerrainXls> listElement = [];

    int maxElement = excel[CarteXlsSheet.nomSheet]!.row(0).toList().length;

    for (var iElem = 1; iElem <= maxElement; iElem++) { //premier element: titre et exemple
        String elementNom = excel[ListElementTerrainXlsSheet.nomSheet]!.row(ListElementTerrainXlsSheet.getSheetColonne(Caracteristique.idElement)).toList()[iElem].value.toString();
        String elementCheminImage = excel[ListElementTerrainXlsSheet.nomSheet]!.row(ListElementTerrainXlsSheet.getSheetColonne(Caracteristique.cheminImage)).toList()[iElem].value.toString();
        String elementTraversable = excel[ListElementTerrainXlsSheet.nomSheet]!.row(ListElementTerrainXlsSheet.getSheetColonne(Caracteristique.traversable)).toList()[iElem].value.toString();
        listElement.add(ElementTerrainXls(id: elementNom, pathImage: elementCheminImage , traversable: elementTraversable));
    }
    return ListElementTerrainXlsSheet(listElement);
  }

  

}

