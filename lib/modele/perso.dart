import 'package:first_flutter_app/modele/carte.dart';
import 'package:first_flutter_app/modele/element_terrain.dart';
import 'package:first_flutter_app/modele/liste_pokemon.dart';
import 'package:first_flutter_app/modele/modele_manager.dart';
import 'dart:math';

class Perso {
  int _x = Carte.taille ~/ 2;
  int _y = Carte.taille ~/ 2;

  int get x => _x;

  int get y => _y;

  void _isPokemonInNextElementTerrain({required ElementTerrain nextBloc}) {
    if (nextBloc.probaPokemon > ModeleManager.epsilonProbas) {
      print("### il y aura peut etre un pkmn");
      Random random = Random();
      double randomDouble = random.nextDouble();
      if (randomDouble < nextBloc.probaPokemon) {
        ModeleManager.inCombat = true;
        ModeleManager.pokemonCombat = ModeleManager.listePokemon.getRandomPokemon()!;
        print("### UN POKEMON APPARAIT");
      }
    }
    else{
      print("### il n'y aura pas de pkmn");
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
