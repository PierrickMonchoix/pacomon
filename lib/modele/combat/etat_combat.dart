import 'package:pacomon/modele/etat_jeu/enum_ordre.dart';

abstract class EtatCombat{
  
  void whenOrder(EnumOrdre ordre);

}