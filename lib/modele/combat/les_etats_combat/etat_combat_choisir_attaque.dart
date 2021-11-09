import 'package:pacomon/modele/combat/combat.dart';
import 'package:pacomon/modele/combat/etat_combat.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_choisir_action.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_hero_attaque.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_hero_va_attaquer.dart';
import 'package:pacomon/modele/etat_jeu/enum_ordre.dart';
import 'package:pacomon/modele/modele_manager.dart';

class EtatCombatChoisirAttaque extends EtatCombat {
  EtatCombatChoisirAttaque({required Combat combat}) : super(combat : combat) ;

  @override
  void whenOrder(EnumOrdre ordre) {
    switch (ordre) {
      case EnumOrdre.A:
        combat.setAndStartEtatCombat(EtatCombatHeroVaAttaquer(combat: combat));
        break;
      case EnumOrdre.B:
        combat.setAndStartEtatCombat(EtatCombatChoisirAction(combat: combat));
        break;
      case EnumOrdre.HAUT:
        combat.selectAttaqueHaut();
        break;
      case EnumOrdre.BAS:
        combat.selectAttaqueBas();
        break;
      case EnumOrdre.DROITE:
        combat.selectAttaqueDroite();
        break;
      case EnumOrdre.GAUCHE:
        combat.selectAttaqueGauche();
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
