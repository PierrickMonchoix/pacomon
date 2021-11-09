import 'package:flutter/cupertino.dart';
import 'package:pacomon/modele/combat/combat.dart';
import 'package:pacomon/modele/etat_jeu/enum_ordre.dart';

abstract class EtatCombat{

  Combat combat;

  EtatCombat({required Combat combat}) : combat = combat;

  
  void start();

  void whenOrder(EnumOrdre ordre);



}