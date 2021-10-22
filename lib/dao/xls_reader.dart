import 'dart:io';
import 'package:first_flutter_app/dao/xls_elements/carte_sheet/elements_primaires/id_element_terrain_xls.dart';
import 'package:first_flutter_app/dao/xls_elements/carte_sheet/sheet/carte_xls_sheet.dart';
import 'package:first_flutter_app/dao/xls_elements/liste_element_terrain_sheet/elements_primaires/elements_terrain_xls.dart';
import 'package:first_flutter_app/dao/xls_elements/liste_element_terrain_sheet/sheet/liste_element_terrain_xls_sheet.dart';
import 'package:path/path.dart';
import 'package:excel/excel.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;

class XlsReader {

  static Future<CarteXls> getCarteXls({required String xlsPath}) async {
    ByteData data = await rootBundle.load(xlsPath);
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);

    List<List<IdElementTerrainXls>> matrice =
        List.generate(CarteXls.taille, (i) => List.empty(growable: true));

    for (var i = 0; i < CarteXls.taille; i++) {
      for (var j = 0; j < CarteXls.taille; j++) {
        String id =
            excel[CarteXls.nomSheet]!.row(i).toList()[j].value.toString();
        matrice[i].add(IdElementTerrainXls(id: id));
      }
    }

    CarteXls returnedCarteX = CarteXls(matrice);

    return returnedCarteX;
  }

  static Future<ListElementTerrainXls> getListElementTerrainXls({required String xlsPath})  async {
    ByteData data = await rootBundle.load(xlsPath);
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);

    List<ElementTerrainXls> listElement = [];

    int maxElement = excel[CarteXls.nomSheet]!.row(0).toList().length;

    for (var iElem = 1; iElem <= maxElement; iElem++) { //premier element: titre et exemple
        String elementNom = excel[ListElementTerrainXls.nomSheet]!.row(ListElementTerrainXls.getSheetColonne(Caracteristique.idElement)).toList()[iElem].value.toString();
        String elementCheminImage = excel[ListElementTerrainXls.nomSheet]!.row(ListElementTerrainXls.getSheetColonne(Caracteristique.cheminImage)).toList()[iElem].value.toString();
        String elementTraversable = excel[ListElementTerrainXls.nomSheet]!.row(ListElementTerrainXls.getSheetColonne(Caracteristique.traversable)).toList()[iElem].value.toString();
        listElement.add(ElementTerrainXls(id: elementNom, pathImage: elementCheminImage , traversable: elementTraversable));
    }
    return ListElementTerrainXls(listElement);
  }

  

}

