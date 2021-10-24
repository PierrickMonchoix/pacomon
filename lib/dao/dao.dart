import 'package:first_flutter_app/dao/xls_elements/liste_element_terrain_sheet/elements_primaires/elements_terrain_xls.dart';
import 'package:first_flutter_app/modele/element_terrain.dart';

class Dao {


  static ElementTerrain elementTerrainFromXls(ElementTerrainXls elementTerrainXls){
    ElementTerrain elementTerrain = ElementTerrain();
    elementTerrain.nom = elementTerrainXls.id;
    elementTerrain.pathImage = elementTerrainXls.pathImage;
    elementTerrain.traversable = elementTerrainXls.traversable == "OUI" ? true : false;
    return elementTerrain;
  }

/*   static Carte getCarte() async {

    CarteXlsSheet carteXls = await XlsReader.getCarteXls(xlsPath: "assets/for_tests/database_test.xlsx");
    List<List<ElementTerrain>> matriceElementTerrain = List.generate(Carte.taille, (i) => List.generate(Carte.taille, (j) => ElementTerrain());
    Carte carte;
    
    for (int i = 0; i < Carte.taille; i++) {
      for (int j = 0; j < Carte.taille; j++){
        matriceElementTerrain[i][j];
      }
    }


  } */

}