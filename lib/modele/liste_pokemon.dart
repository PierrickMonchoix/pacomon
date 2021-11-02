import 'package:flutter/foundation.dart';
import 'dart:math';
import 'package:pacomon/modele/pokemon.dart';

class ListePokemon {
  List<Pokemon> _listPokemon = [];
  List<double> _sumListOfRarete = [];

  ListePokemon({required List<Pokemon> listPokemon}) : _listPokemon = listPokemon {
    _sumListOfRarete.add(0.0);
    for (int i = 0; i < _listPokemon.length ; i++) {
      _sumListOfRarete.add(_sumListOfRarete[i] + _listPokemon[i].rarete);
    }
  }


  Pokemon getPokemonFromNom(String nomPkmn) {
    return _listPokemon.firstWhere((element) => element.nom == nomPkmn);
  }

  Pokemon? getRandomPokemon(){
    Random random = Random();
    double randomDouble = random.nextDouble();
    for (int i = 0; i < _sumListOfRarete.length - 1; i++) {
      if( _sumListOfRarete[i] <= randomDouble && randomDouble <= _sumListOfRarete[i+1]){
        return _listPokemon[i];
      }
    }
    return null;
  } 

  @override
  String toString() => 'ListePokemon(_listPokemon: $_listPokemon)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ListePokemon &&
      listEquals(other._listPokemon, _listPokemon);
  }

  @override
  int get hashCode => _listPokemon.hashCode;
}
