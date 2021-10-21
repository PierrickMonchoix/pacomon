import 'dart:io';
import 'package:first_flutter_app/map_model.dart';
import 'package:path/path.dart';
import 'package:excel/excel.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'element_decort.dart';

class ManageXlsData {
  static Future<int> getPrimaryData() async {
    /* Your blah blah code here */

    ByteData data = await rootBundle.load("assets/for_tests/for_flutter.xlsx");
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);

/*
    print(excel["Feuil1"].cell(CellIndex.indexByString("A1")).value);
    for (var table in excel.tables.keys) {
      print(table); //sheet Name
      print(excel.tables[table]!.maxCols);
      print(excel.tables[table]!.maxRows);
      for (var row in excel.tables[table]!.rows) {
        print("$row");
      }
    }
*/

    int resultat = excel["Feuil1"].cell(CellIndex.indexByString("A1")).value;
   
    return resultat;
  }

  static Future<MapModel> getData() async {
    ByteData data = await rootBundle.load("assets/for_tests/map.xlsx");
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);
    //print(excel["carte"]!.row(1).toList()[1].value);

    MapModel mapModel = MapModel();


    for (var i = 0; i < MapModel.size; i++) {
      for (var j = 0; j < MapModel.size; j++) {
        String path = excel["carte"]!.row(i).toList()[j].value.toString();
        mapModel.matrice[i][j].pathImg = path;
      }
    }
    return mapModel;


    //excel["carte"]!.row(1).toList()[1].toString();
  }
}
