import 'package:pacomon/modele/combat/etat_combat.dart';
import 'package:pacomon/modele/etat_jeu/enum_ordre.dart';
import 'package:pacomon/modele/etat_jeu/les_etats_jeu/etat_jeu_game_over.dart';
import 'package:pacomon/modele/modele_manager.dart';

class EtatCombatHeroPerd implements EtatCombat {
  @override
  void whenOrder(EnumOrdre ordre) {
    ModeleManager.etatJeu = EtatJeuGameOver();
  }

}