import 'dart:io';
import 'package:path/path.dart';
import 'package:excel/excel.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;

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
}
