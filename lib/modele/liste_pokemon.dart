import 'package:flutter/foundation.dart';
import 'dart:math';
import 'package:pacomon/modele/pacomon.dart';

class ListePacomon {
  List<Pacomon> _listPacomon = [];

  ListePacomon({required List<Pacomon> listPacomon}) : _listPacomon = listPacomon {
    
  }


  Pacomon getPacomonFromNom(String nomPkmn) {
    return _listPacomon.firstWhere((element) => element.nom == nomPkmn);
  }

  Pacomon getRandomPacomon(String categorie){
  print(">>>>>>>>>>>  _listPacomon : " + _listPacomon.toString());

  List<Pacomon>  listPacomonDeLaBonneCategorie = _listPacomon.where((pacomon) => pacomon.categorie == categorie).toList();
   print(">>>>>>>>>>>  " + categorie.toString());
   print(">>>>>>>>>>>  _listPacomonDeLaBonneCategorie : " + listPacomonDeLaBonneCategorie.toString());
   List<double> sumListOfRarete = [];
   sumListOfRarete.add(0.0);
    for (int i = 0; i < listPacomonDeLaBonneCategorie.length ; i++) {
      sumListOfRarete.add(sumListOfRarete[i] + listPacomonDeLaBonneCategorie[i].rarete);
    }

   
    Random random = Random();
    double randomDouble = random.nextDouble();
    for (int i = 0; i < sumListOfRarete.length - 1; i++) {
      if( sumListOfRarete[i] <= randomDouble && randomDouble <= sumListOfRarete[i+1]){
        return Pacomon.fromOther( listPacomonDeLaBonneCategorie[i] );
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
