import 'package:first_flutter_app/dao/xls_elements/carte_sheet/elements_primaires/id_element_terrain_xls.dart';
import 'package:first_flutter_app/dao/xls_elements/carte_sheet/sheet/carte_xls_sheet.dart';
import 'package:first_flutter_app/dao/xls_elements/liste_element_terrain_sheet/elements_primaires/elements_terrain_xls.dart';
import 'package:first_flutter_app/dao/xls_elements/liste_element_terrain_sheet/sheet/liste_element_terrain_xls_sheet.dart';
import 'package:first_flutter_app/dao/xls_reader.dart';
import 'package:first_flutter_app/modele/carte.dart';
import 'package:first_flutter_app/modele/element_terrain.dart';

class Dao {

  static Future<ElementTerrainXls> getElementTerrainFromId({required IdElementTerrainXls idElementTerrainXls}) async {
    ListElementTerrainXlsSheet listElementXls = await XlsReader.getListElementTerrainXls(xlsPath: "assets/for_tests/database_test.xlsx");
    return listElementXls.list.firstWhere((element) => element.id == idElementTerrainXls.id);
  }


  static void setElementTerrainFromXls({required ElementTerrain elementTerrain , required ElementTerrainXls elementTerrainXls}){
    elementTerrain.setAll(nom: elementTerrainXls.id, traversable: elementTerrainXls.traversable == "OUI" ? true : false, pathImage: elementTerrainXls.pathImage);
  }

/*     static Future<Carte> getCarte() async {

    CarteXlsSheet carteXls = await XlsReader.getCarteXls(xlsPath: "assets/for_tests/database_test.xlsx");
    List<List<ElementTerrain>> matriceElementTerrain = List.generate(Carte.taille, (i) => List.generate(Carte.taille, (j) => ElementTerrain.vide());
    Carte carte;
    
    for (int i = 0; i < Carte.taille; i++) {
      for (int j = 0; j < Carte.taille; j++){
        setElementTerrainFromXls(elementTerrain: matriceElementTerrain[i][j] , elementTerrainXls: carteXls.matrice[i][j]);
      }
    }


  }  */ 

}