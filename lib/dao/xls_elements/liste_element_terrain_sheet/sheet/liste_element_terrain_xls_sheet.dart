import 'package:pacomon/dao/xls_elements/liste_element_terrain_sheet/elements_primaires/elements_terrain_xls.dart';

enum CaracteristiqueElementTerrainXls { idElement, cheminImage, traversable, probaPacomon }

class ListElementTerrainXlsSheet {
  static const String nomSheet = "element_terrain";

  static const Map<CaracteristiqueElementTerrainXls, int> caracteristiquesMap = {
    CaracteristiqueElementTerrainXls.idElement : 0,
    CaracteristiqueElementTerrainXls.cheminImage : 1,
    CaracteristiqueElementTerrainXls.traversable : 2,
    CaracteristiqueElementTerrainXls.probaPacomon : 3,
  };

  static int getNombreCaracteristiques() => CaracteristiqueElementTerrainXls.values.length;

  static int getSheetColonne(CaracteristiqueElementTerrainXls caracteristique){
    return caracteristiquesMap[caracteristique]!;
  }

  final List<ElementTerrainXls> _list;

  ListElementTerrainXlsSheet(List<ElementTerrainXls> list) : _list = list;

  List<ElementTerrainXls> get list => _list;

  @override
  String toString() => 'ListElementTerrainXls(_list: $_list)';
}
