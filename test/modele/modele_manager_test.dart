import 'package:flutter_test/flutter_test.dart';
import 'package:pacomon/modele/attaque/attaque.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_choisir_attaque.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_hero_attaque.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_pacomon_apparait.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_pacomon_attaque.dart';
import 'package:pacomon/modele/etat_jeu/enum_ordre.dart';
import 'package:pacomon/modele/etat_jeu/les_etats_jeu/etat_jeu_combat.dart';
import 'package:pacomon/modele/etat_jeu/les_etats_jeu/etat_jeu_marche.dart';
import 'package:pacomon/modele/modele_manager.dart';
import 'package:pacomon/modele/pacomon.dart';
import 'package:pacomon/modele/perso.dart';

void main() {
  testWidgets('pop du combat', (tester) async {
    await ModeleManager.initialize();
    ModeleManager.perso.attaque1 = Attaque(nom: "charge" , perso: ModeleManager.perso, effet: (Perso perso, Pacomon pacomon) { pacomon.recevoirDegatsNet(perso.atk); });

    int ATK_PCMN = 30;
    int DEF_PCMN = 0;
    int PV_PCMN = 100;

    int ATK_HERO = 70;
    int DEF_HERO = 100;
    int PV_HERO = 80;

    expect(ModeleManager.etatJeu is EtatJeuMarche, true);
    ModeleManager.sendOrderEtatJeu(EnumOrdre.DEMARRER_COMBAT);
    expect(ModeleManager.etatJeu is EtatJeuCombat, true);
    ModeleManager.combat.pacomon.FOR_TEST_setAtk(ATK_PCMN);
    ModeleManager.combat.pacomon.FOR_TEST_setDef(DEF_PCMN);
    ModeleManager.combat.pacomon.FOR_TEST_setPv(PV_PCMN); 
    ModeleManager.perso.FOR_TEST_setAtk(ATK_HERO);
    ModeleManager.perso.FOR_TEST_setDef(DEF_HERO);
    ModeleManager.perso.FOR_TEST_setPv(PV_HERO); 

    expect(ModeleManager.combat.etatCombat is EtatCombatPacomonApparait, true);
    ModeleManager.sendOrderEtatJeu(EnumOrdre.A);
    expect(ModeleManager.combat.etatCombat is EtatCombatChoisirAttaque, true);
    expect(ModeleManager.combat.pacomon.pv , PV_PCMN);
    ModeleManager.sendOrderEtatJeu(EnumOrdre.A);
    expect(ModeleManager.combat.etatCombat is EtatCombatHeroAttaque, true);
    expect(ModeleManager.combat.pacomon.pv , PV_PCMN - ATK_HERO); // car def pacomon 0
    expect(ModeleManager.perso.pv , PV_HERO );
    ModeleManager.sendOrderEtatJeu(EnumOrdre.A);
    expect(ModeleManager.combat.etatCombat is EtatCombatPacomonAttaque, true);
    expect(ModeleManager.perso.pv , PV_HERO - ATK_PCMN ~/2 ); // car def hero 100


  } , tags: "t");
  
}