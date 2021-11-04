import 'package:pacomon/modele/combat/etat_combat.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_choisir_attaque.dart';
import 'package:pacomon/modele/etat_jeu/enum_ordre.dart';
import 'package:pacomon/modele/modele_manager.dart';
import 'package:pacomon/modele/pacomon.dart';

import 'etat_combat_hero_attaque.dart';
import 'etat_combat_hero_gagne.dart';
import 'etat_combat_hero_perd.dart';

class EtatCombatPacomonAttaque implements EtatCombat {
  EtatCombatPacomonAttaque() {
    print("€€€ enter EtatCombatPacomonAttaque");
    print("pv pcmn: " + ModeleManager.combat.pacomon.pv.toString());
  }

  @override
  void whenOrder(EnumOrdre ordre) {
    // TODO: implement whenOrder
  }

  @override
  String toString() {
    // TODO: implement toString
    return "EtatCombatPacomonAttaque";
  }

  @override
  void start() {
    ModeleManager.combat.pacomon.attaquerPerso(ModeleManager.perso);
    if (ModeleManager.perso.pv == 0) {
      ModeleManager.setAndStartEtatCombat(EtatCombatHeroPerd());
    } else if (ModeleManager.combat.pacomon.pv == 0) {
      ModeleManager.setAndStartEtatCombat(EtatCombatHeroGagne());
    } else {
      ModeleManager.setAndStartEtatCombat(EtatCombatChoisirAttaque());
    }
  }
}
