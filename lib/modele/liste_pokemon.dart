import 'package:flutter/foundation.dart';
import 'dart:math';
import 'package:pacomon/modele/pacomon.dart';

class ListePacomon {
  List<Pacomon> _listPacomon = [];
  List<double> _sumListOfRarete = [];

  ListePacomon({required List<Pacomon> listPacomon}) : _listPacomon = listPacomon {
    _sumListOfRarete.add(0.0);
    for (int i = 0; i < _listPacomon.length ; i++) {
      _sumListOfRarete.add(_sumListOfRarete[i] + _listPacomon[i].rarete);
    }
  }


  Pacomon getPacomonFromNom(String nomPkmn) {
    return _listPacomon.firstWhere((element) => element.nom == nomPkmn);
  }

  Pacomon getRandomPacomon(){
    Random random = Random();
    double randomDouble = random.nextDouble();
    for (int i = 0; i < _sumListOfRarete.length - 1; i++) {
      if( _sumListOfRarete[i] <= randomDouble && randomDouble <= _sumListOfRarete[i+1]){
        return _listPacomon[i];
      }
    }
    throw Exception("getRandomPacomon a echoue");
  } 

  @override
  String toString() => 'ListePacomon(_listPacomon: $_listPacomon)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ListePacomon &&
      listEquals(other._listPacomon, _listPacomon);
  }

  @override
  int get hashCode => _listPacomon.hashCode;
}
