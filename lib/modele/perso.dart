import 'package:pacomon/modele/carte.dart';
import 'package:pacomon/modele/element_terrain.dart';
import 'package:pacomon/modele/liste_pokemon.dart';
import 'package:pacomon/modele/modele_manager.dart';
import 'dart:math';

class Perso {
  int _x;
  int _y;

  int get x => _x;

  int get y => _y;

  Perso({required int x , required int y}) : _x = x, _y = y;

  void _isPokemonInNextElementTerrain({required ElementTerrain nextBloc}) {
    if (nextBloc.probaPokemon > ModeleManager.epsilonProbas) {
      Random random = Random();
      double randomDouble = random.nextDouble();
      if (randomDouble < nextBloc.probaPokemon) {
        ModeleManager.inCombat = true;
        ModeleManager.pokemonCombat = ModeleManager.listePokemon.getRandomPokemon()!;
      }
    }
  }

  void marcheHaut() {
    ElementTerrain nextBloc =
        ModeleManager.carte.getElementTerrainFromCoord(y: _y - 1, x: _x);
    _isPokemonInNextElementTerrain(nextBloc: nextBloc);
    if (nextBloc.traversable) {
      _y--;
    }
  }

  void marcheBas() {
    ElementTerrain nextBloc =
        ModeleManager.carte.getElementTerrainFromCoord(y: _y + 1, x: _x);
     _isPokemonInNextElementTerrain(nextBloc: nextBloc);
    if (nextBloc.traversable) {
      _y++;
    }
  }

  void marcheGauche() {
    ElementTerrain nextBloc =
        ModeleManager.carte.getElementTerrainFromCoord(y: _y, x: _x - 1);
    _isPokemonInNextElementTerrain(nextBloc: nextBloc);
    if (nextBloc.traversable) {
      _x--;
    }
  }

  void marcheDroite() {
    ElementTerrain nextBloc =
        ModeleManager.carte.getElementTerrainFromCoord(y: _y, x: _x + 1);
    _isPokemonInNextElementTerrain(nextBloc: nextBloc);
    if (nextBloc.traversable) {
      _x++;
    }
  }
}
