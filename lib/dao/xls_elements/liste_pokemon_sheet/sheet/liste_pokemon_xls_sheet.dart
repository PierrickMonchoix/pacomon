
import 'package:pacomon/dao/xls_elements/liste_pokemon_sheet/elements_primaires/pokemon_xls.dart';

enum CaracteristiquePokemonXls { nom, cheminImage, rarete }

class ListePokemonXlsSheet {
  static const String nomSheet = "pokemon";

  static const Map<CaracteristiquePokemonXls, int> caracteristiquesMap = {
    CaracteristiquePokemonXls.nom : 0,
    CaracteristiquePokemonXls.cheminImage : 1,
    CaracteristiquePokemonXls.rarete : 2
  };

  static int getNombreCaracteristiques() => CaracteristiquePokemonXls.values.length;

  static int getSheetColonne(CaracteristiquePokemonXls caracteristique){
    return caracteristiquesMap[caracteristique]!;
  }

  final List<PokemonXls> _list;

  ListePokemonXlsSheet(List<PokemonXls> list) : _list = list;

  List<PokemonXls> get list => _list;

  

  @override
  String toString() => 'ListPokemonXlsSheet(_list: $_list)';
}
