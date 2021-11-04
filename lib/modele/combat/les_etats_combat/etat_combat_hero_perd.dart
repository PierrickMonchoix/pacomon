import 'package:pacomon/modele/combat/etat_combat.dart';
import 'package:pacomon/modele/etat_jeu/enum_ordre.dart';
import 'package:pacomon/modele/etat_jeu/les_etats_jeu/etat_jeu_game_over.dart';
import 'package:pacomon/modele/modele_manager.dart';

class EtatCombatHeroPerd implements EtatCombat {
  EtatCombatHeroPerd() {
    print("€€€ enter EtatCombatHeroPerd");
    print("pv pcmn: " + ModeleManager.combat.pacomon.pv.toString());
  }

  @override
  void whenOrder(EnumOrdre ordre) {
    ModeleManager.etatJeu = EtatJeuGameOver();
  }

@override
  String toString() {
    // TODO: implement toString
    return "EtatCombatHeroPerd";
  }

  @override
  void start() {
    // TODO: implement start
  }

}
