import 'package:pacomon/modele/combat/etat_combat.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_choisir_action.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_hero_attaque.dart';
import 'package:pacomon/modele/etat_jeu/enum_ordre.dart';
import 'package:pacomon/modele/modele_manager.dart';

class EtatCombatChoisirAttaque implements EtatCombat {
  EtatCombatChoisirAttaque() {
    print("€€€ enter EtatCombatChoisirAttaque");
    print("pv pcmn: " + ModeleManager.combat.pacomon.pv.toString());
  }

  @override
  void whenOrder(EnumOrdre ordre) {
    switch (ordre) {
      case EnumOrdre.A:
        ModeleManager.setAndStartEtatCombat(EtatCombatHeroAttaque());
        break;
      case EnumOrdre.B:
        ModeleManager.setAndStartEtatCombat(EtatCombatChoisirAction());
        break;
      case EnumOrdre.HAUT:
        ModeleManager.combat.selectAttaqueHaut();
        break;
      case EnumOrdre.BAS:
        ModeleManager.combat.selectAttaqueBas();
        break;
      case EnumOrdre.DROITE:
        ModeleManager.combat.selectAttaqueDroite();
        break;
      case EnumOrdre.GAUCHE:
        ModeleManager.combat.selectAttaqueGauche();
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
