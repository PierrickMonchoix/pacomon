import 'package:first_flutter_app/dao/xls_elements/carte_sheet/elements_primaires/id_element_terrain_xls.dart';
import 'package:first_flutter_app/dao/xls_elements/carte_sheet/sheet/carte_xls_sheet.dart';
import 'package:first_flutter_app/dao/xls_elements/liste_element_terrain_sheet/elements_primaires/elements_terrain_xls.dart';
import 'package:first_flutter_app/dao/xls_elements/liste_element_terrain_sheet/sheet/liste_element_terrain_xls_sheet.dart';
import 'package:first_flutter_app/dao/xls_reader.dart';
import 'package:first_flutter_app/modele/carte.dart';
import 'package:first_flutter_app/modele/element_terrain.dart';

class Dao { //"assets/for_tests/database_test.xlsx"

  static Future<ElementTerrainXls> getElementTerrainXlsFromElementTerrainIdXls({required IdElementTerrainXls idElementTerrainXls ,  required String xlsPath}) async {
    ListElementTerrainXlsSheet listElementXls = await XlsReader.getListElementTerrainXls(xlsPath: xlsPath);
    return listElementXls.list.firstWhere((element) => element.id == idElementTerrainXls.id);
  }


  static void setElementTerrainFromElementTerrainXls({required ElementTerrain elementTerrain , required ElementTerrainXls elementTerrainXls}){
    elementTerrain.setAll(nom: elementTerrainXls.id, traversable: elementTerrainXls.traversable == "OUI" ? true : false, pathImage: elementTerrainXls.pathImage);
  }


    //PUBLIC :

 static Future<void> setCarte({ required Carte carte ,  required String xlsPath}) async {

    CarteXlsSheet carteXls = await XlsReader.getCarteXls(xlsPath: xlsPath);
    List<List<ElementTerrain>> matriceElementTerrain = List.generate(Carte.taille, (i) => List.generate(Carte.taille, (j) => ElementTerrain.vide()));
    
    for (int i = 0; i < Carte.taille; i++) {
      for (int j = 0; j < Carte.taille; j++){
        setElementTerrainFromElementTerrainXls(elementTerrain: matriceElementTerrain[i][j] , elementTerrainXls: await getElementTerrainXlsFromElementTerrainIdXls(idElementTerrainXls: carteXls.matrice[i][j] , xlsPath: xlsPath));
      }
    }

    carte.setMatrice(matriceElementTerrain: matriceElementTerrain);

  }  

}