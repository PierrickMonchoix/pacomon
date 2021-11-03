import 'package:pacomon/modele/combat/etat_combat.dart';
import 'package:pacomon/modele/etat_jeu/enum_ordre.dart';
import 'package:pacomon/modele/modele_manager.dart';
import 'package:pacomon/modele/pacomon.dart';

import 'etat_combat_hero_attaque.dart';
import 'etat_combat_hero_gagne.dart';
import 'etat_combat_hero_perd.dart';

class EtatCombatPacomonAttaque implements EtatCombat {
  EtatCombatPacomonAttaque() {
    ModeleManager.combat.pacomon.attaquerPerso(ModeleManager.perso);
    if (ModeleManager.perso.pv == 0) {
      ModeleManager.combat.etatCombat = EtatCombatHeroPerd();
    } else if (ModeleManager.combat.pacomon.pv == 0) {
      ModeleManager.combat.etatCombat = EtatCombatHeroGagne();
    } else {
      ModeleManager.combat.etatCombat = EtatCombatHeroAttaque();
    }
  }

  @override
  void whenOrder(EnumOrdre ordre) {
    // TODO: implement whenOrder
  }
}
