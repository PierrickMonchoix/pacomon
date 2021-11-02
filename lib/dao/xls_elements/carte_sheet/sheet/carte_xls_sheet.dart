
import 'package:pacomon/dao/xls_elements/carte_sheet/elements_primaires/id_element_terrain_xls.dart';

class CarteXlsSheet {

  static const nomSheet = "carte";

  final List<List<IdElementTerrainXls>> _matrice;
 
  CarteXlsSheet(List<List<IdElementTerrainXls>> matrice) : _matrice = matrice;

  List<List<IdElementTerrainXls>> get matrice => _matrice;

}