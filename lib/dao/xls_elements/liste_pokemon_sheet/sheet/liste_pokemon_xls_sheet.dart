
import 'package:pacomon/dao/xls_elements/liste_pokemon_sheet/elements_primaires/pokemon_xls.dart';

enum CaracteristiquePacomonXls { nom, cheminImage, rarete }

class ListePacomonXlsSheet {
  static const String nomSheet = "pokemon";

  static const Map<CaracteristiquePacomonXls, int> caracteristiquesMap = {
    CaracteristiquePacomonXls.nom : 0,
    CaracteristiquePacomonXls.cheminImage : 1,
    CaracteristiquePacomonXls.rarete : 2
  };

  static int getNombreCaracteristiques() => CaracteristiquePacomonXls.values.length;

  static int getSheetColonne(CaracteristiquePacomonXls caracteristique){
    return caracteristiquesMap[caracteristique]!;
  }

  final List<PacomonXls> _list;

  ListePacomonXlsSheet(List<PacomonXls> list) : _list = list;

  List<PacomonXls> get list => _list;

  

  @override
  String toString() => 'ListPokemonXlsSheet(_list: $_list)';
}
