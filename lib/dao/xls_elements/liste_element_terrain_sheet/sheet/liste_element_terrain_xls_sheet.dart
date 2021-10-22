import 'package:first_flutter_app/dao/xls_elements/carte_sheet/sheet/carte_xls_sheet.dart';
import 'package:first_flutter_app/dao/xls_elements/liste_element_terrain_sheet/elements_primaires/elements_terrain_xls.dart';

enum Caracteristique { idElement, cheminImage, traversable }

class ListElementTerrainXls {
  static const String nomSheet = "element_terrain";

  static const Map<Caracteristique, int> caracteristiquesMap = {
    Caracteristique.idElement : 0,
    Caracteristique.cheminImage : 1,
    Caracteristique.traversable : 2
  };

  static int getNombreCaracteristiques() => Caracteristique.values.length;

  static int getSheetColonne(Caracteristique caracteristique){
    return caracteristiquesMap[caracteristique]!;
  }

  final List<ElementTerrainXls> _list;

  ListElementTerrainXls(List<ElementTerrainXls> list) : _list = list;

  List<ElementTerrainXls> get list => _list;

  @override
  String toString() => 'ListElementTerrainXls(_list: $_list)';
}
