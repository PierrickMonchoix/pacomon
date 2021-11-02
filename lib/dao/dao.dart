import 'package:first_flutter_app/dao/xls_elements/carte_sheet/elements_primaires/id_element_terrain_xls.dart';
import 'package:first_flutter_app/dao/xls_elements/carte_sheet/sheet/carte_xls_sheet.dart';
import 'package:first_flutter_app/dao/xls_elements/liste_element_terrain_sheet/elements_primaires/elements_terrain_xls.dart';
import 'package:first_flutter_app/dao/xls_elements/liste_element_terrain_sheet/sheet/liste_element_terrain_xls_sheet.dart';
import 'package:first_flutter_app/dao/xls_elements/liste_pokemon_sheet/elements_primaires/pokemon_xls.dart';
import 'package:first_flutter_app/dao/xls_elements/liste_pokemon_sheet/sheet/liste_pokemon_xls_sheet.dart';
import 'package:first_flutter_app/dao/xls_reader.dart';
import 'package:first_flutter_app/modele/carte.dart';
import 'package:first_flutter_app/modele/element_terrain.dart';
import 'package:first_flutter_app/modele/liste_pokemon.dart';
import 'package:first_flutter_app/modele/pokemon.dart';

class Dao {
  //"assets/for_tests/database_test.xlsx"

  static Map<String, ListElementTerrainXlsSheet> _listElementTerrainXlsSheetMap = {};

  static Future<ListElementTerrainXlsSheet> _getListElementTerrainXlsSheetInstance({required String xlsPath}) async {
    if(_listElementTerrainXlsSheetMap.containsKey(xlsPath)){
      return _listElementTerrainXlsSheetMap[xlsPath]!;
    }
    _listElementTerrainXlsSheetMap[xlsPath] = await XlsReader.getListElementTerrainXlsSheet(xlsPath: xlsPath);
    return _listElementTerrainXlsSheetMap[xlsPath]!;
  }

  static Future<ElementTerrainXls> _getElementTerrainXlsFromElementTerrainIdXls(
      {required IdElementTerrainXls idElementTerrainXls,
      required String xlsPath}) async {
    ListElementTerrainXlsSheet listElementXls =
        await _getListElementTerrainXlsSheetInstance(xlsPath: xlsPath);
    return listElementXls.list
        .firstWhere((element) => element.id == idElementTerrainXls.id);
  }

  static ElementTerrain _getElementTerrainFromElementTerrainXls(
      {required ElementTerrainXls elementTerrainXls}) {
    ElementTerrain elementTerrain = ElementTerrain(
        nom: elementTerrainXls.id,
        traversable: elementTerrainXls.traversable == "OUI" ? true : false,
        pathImage: elementTerrainXls.pathImage,
        probaPokemon: double.parse(elementTerrainXls.probaPokemon)/100
        );
    return elementTerrain;
  }

  static Pokemon _getPokemonFromPokemonXls({required PokemonXls pokemonXls}) {
    Pokemon pokemon = Pokemon(
        nom: pokemonXls.nom,
        pathImage: pokemonXls.pathImage,
        rarete: double.parse(pokemonXls.rarete)/100
        );
    return pokemon;
  }

  //static Pokemon _getPokemon

  //PUBLIC :

  static Future<int> getTailleCarteModele({required String xlsPath}) async {
    return int.parse(await XlsReader.getTailleCarteModeleXls(xlsPath: xlsPath));
  }

    static Future<int> getTailleCarteVue({required String xlsPath}) async {
    return int.parse(await XlsReader.getTailleCarteVueXls(xlsPath: xlsPath));
  }

    static Future<int> getXSpawnHero({required String xlsPath}) async {
    return int.parse(await XlsReader.getXSpawnHeroXls(xlsPath: xlsPath));
  }

    static Future<int> getYSpawnHero({required String xlsPath}) async {
    return int.parse(await XlsReader.getYSpawnHeroXls(xlsPath: xlsPath));
  }


  static Future<Carte> getCarteFromXlsPath({required String xlsPath}) async {
    CarteXlsSheet carteXls = await XlsReader.getCarteXls(xlsPath: xlsPath);
    Carte.taille = await getTailleCarteModele(xlsPath: xlsPath);

    print("taille carte data model: " + await getTailleCarteModele(xlsPath: xlsPath) .toString());

    List<List<ElementTerrain>> matriceElementTerrain = List.generate(
        Carte.taille,
        (i) => List.generate(Carte.taille, (j) => ElementTerrain.vide()));

    for (int i = 0; i < Carte.taille; i++) {
      for (int j = 0; j < Carte.taille; j++) {
        ElementTerrain elementTerrain = _getElementTerrainFromElementTerrainXls(
            elementTerrainXls:
                await _getElementTerrainXlsFromElementTerrainIdXls(
                    idElementTerrainXls: carteXls.matrice[i][j],
                    xlsPath: xlsPath));
        matriceElementTerrain[i][j] = elementTerrain;
      }
    }
    Carte carte = Carte(matriceElementTerrain: matriceElementTerrain);
    return carte;
  }

  static Future<ListePokemon> getListePokemonFromXlsPath({required String xlsPath}) async {
    ListePokemonXlsSheet listePokemonXlsSheet =
        await XlsReader.getListePokemonXlsSheet(xlsPath: xlsPath);
    List<Pokemon> listPokemon= [];

    for (PokemonXls pokemonXls in listePokemonXlsSheet.list) {
      Pokemon newPokemon = _getPokemonFromPokemonXls(pokemonXls: pokemonXls);
      listPokemon.add(newPokemon);
    }
    return ListePokemon(listPokemon: listPokemon);
  }

  
  
}
