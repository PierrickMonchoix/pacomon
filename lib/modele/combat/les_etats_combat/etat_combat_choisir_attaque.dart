import 'package:pacomon/modele/combat/etat_combat.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_hero_attaque.dart';
import 'package:pacomon/modele/etat_jeu/enum_ordre.dart';
import 'package:pacomon/modele/modele_manager.dart';

class EtatCombatChoisirAttaque implements EtatCombat {
  @override
  void whenOrder(EnumOrdre ordre) {
    switch (ordre) {
            case EnumOrdre.A :
      ModeleManager.combat.etatCombat = EtatCombatHeroAttaque();
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
}
