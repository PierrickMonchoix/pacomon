import 'package:pacomon/modele/combat/etat_combat.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_choisir_attaque.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_hero_attaque.dart';
import 'package:pacomon/modele/etat_jeu/enum_ordre.dart';
import 'package:pacomon/modele/modele_manager.dart';

class EtatCombatChoisirAction implements EtatCombat {
  EtatCombatChoisirAction() {
    print("€€€ enter EtatCombatChoisirAction");
    print("pv pcmn: " + ModeleManager.combat.pacomon.pv.toString());
  }

  @override
  void whenOrder(EnumOrdre ordre) {
    switch (ordre) {
      case EnumOrdre.A:
        ModeleManager.setAndStartEtatCombat(EtatCombatChoisirAttaque());
        break;

      default:
    }
  }

  @override
  String toString() {
    // TODO: implement toString
    return "EtatCombatChoisirAttaque";
  }

  @override
  void start() {
    // TODO: implement start
  }
}
