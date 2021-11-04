import 'package:pacomon/modele/etat_jeu/enum_ordre.dart';

abstract class EtatJeu{

  void whenOrder(EnumOrdre ordre);

  void start();

}