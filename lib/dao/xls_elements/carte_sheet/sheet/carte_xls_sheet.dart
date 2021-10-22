

import 'package:first_flutter_app/dao/xls_elements/carte_sheet/elements_primaires/id_element_terrain_xls.dart';

class CarteXls {

  static const taille = 3;
  static const nomSheet = "carte";

  final List<List<IdElementTerrainXls>> _matrice;
 
  CarteXls(List<List<IdElementTerrainXls>> matrice) : _matrice = matrice;

  List<List<IdElementTerrainXls>> get matrice => _matrice;

}