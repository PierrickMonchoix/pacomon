import 'package:flutter_test/flutter_test.dart';
import 'package:pacomon/modele/attaque/attaque.dart';
import 'package:pacomon/modele/combat/combat.dart';
import 'package:pacomon/modele/combat/etat_combat.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_choisir_action.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_choisir_attaque.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_hero_attaque.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_hero_va_attaquer.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_pacomon_apparait.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_a_qui_le_tour.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_pacomon_attaque.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_pacomon_va_attaquer.dart';
import 'package:pacomon/modele/etat_jeu/enum_ordre.dart';
import 'package:pacomon/modele/modele_manager.dart';
import 'package:pacomon/modele/pacomon.dart';
import 'package:pacomon/modele/perso.dart';
import 'package:pacomon/test_manager.dart';

void main() {
  testWidgets('hero est simplement plus rapide', (tester) async {
    int VIT_HERO_11 = 11;
    int VIT_PCMN_10 = 10;

    Perso hero = Perso(
        atk: 0,
        augmentationStatParNiveau: 0,
        def: 1000,
        pv: 1000,
        vit: VIT_HERO_11,
        x: 0,
        y: 0);
    hero.attaque1 = Attaque(
      hero: hero,
      ppMax: 1000,
      nom: "rien",
      description: "attaque rien",
      effet: (Perso perso, Pacomon pacomon) {},
    );

    Pacomon pacomon = Pacomon(
        atk: 0,
        categorie: '',
        def: 1000,
        exp: 0,
        nom: '',
        pathImage: '',
        pv: 1000,
        rarete: 0,
        vit: VIT_PCMN_10);
    Combat combat = Combat(hero: hero, pacomon: pacomon);
    combat.start();
    expect(combat.etatCombat, TypeMatcher<EtatCombatPacomonApparait>());
    // a qui le tour
    combat.whenOrder(ordre: EnumOrdre.A);
    expect(combat.etatCombat, TypeMatcher<EtatCombatChoisirAction>());
    combat.whenOrder(ordre: EnumOrdre.A);
    expect(combat.etatCombat, TypeMatcher<EtatCombatChoisirAttaque>());
    combat.whenOrder(ordre: EnumOrdre.A);
    expect(combat.etatCombat, TypeMatcher<EtatCombatHeroVaAttaquer>());
    combat.whenOrder(ordre: EnumOrdre.A);
    // a qui le tour
    expect(combat.etatCombat, TypeMatcher<EtatCombatPacomonVaAttaquer>());
    combat.whenOrder(ordre: EnumOrdre.A);
    expect(combat.etatCombat, TypeMatcher<EtatCombatPacomonAttaque>());
    combat.whenOrder(ordre: EnumOrdre.A);
    expect(combat.etatCombat, TypeMatcher<EtatCombatChoisirAction>());
  }, tags: "t");

  testWidgets('hero est pile poil simplement plus rapide', (tester) async {
    int VIT_HERO_10 = 10;
    int VIT_PCMN_10 = 10;

    Perso hero = Perso(
        atk: 0,
        augmentationStatParNiveau: 0,
        def: 1000,
        pv: 1000,
        vit: VIT_HERO_10,
        x: 0,
        y: 0);
    hero.attaque1 = Attaque(
      hero: hero,
      ppMax: 1000,
      nom: "rien",
      description: "attaque rien",
      effet: (Perso perso, Pacomon pacomon) {},
    );

    Pacomon pacomon = Pacomon(
        atk: 0,
        categorie: '',
        def: 1000,
        exp: 0,
        nom: '',
        pathImage: '',
        pv: 1000,
        rarete: 0,
        vit: VIT_PCMN_10);
    Combat combat = Combat(hero: hero, pacomon: pacomon);
    combat.start();
    expect(combat.etatCombat, TypeMatcher<EtatCombatPacomonApparait>());
    // a qui le tour
    combat.whenOrder(ordre: EnumOrdre.A);
    expect(combat.etatCombat, TypeMatcher<EtatCombatChoisirAction>());
    combat.whenOrder(ordre: EnumOrdre.A);
    expect(combat.etatCombat, TypeMatcher<EtatCombatChoisirAttaque>());
    combat.whenOrder(ordre: EnumOrdre.A);
    expect(combat.etatCombat, TypeMatcher<EtatCombatHeroVaAttaquer>());
    combat.whenOrder(ordre: EnumOrdre.A);
    // a qui le tour
    expect(combat.etatCombat, TypeMatcher<EtatCombatPacomonVaAttaquer>());
    combat.whenOrder(ordre: EnumOrdre.A);
    expect(combat.etatCombat, TypeMatcher<EtatCombatPacomonAttaque>());
    combat.whenOrder(ordre: EnumOrdre.A);
    expect(combat.etatCombat, TypeMatcher<EtatCombatChoisirAction>());
  }, tags: "t");

  testWidgets('hero est simplement moins rapide que pcmn', (tester) async {
    int VIT_HERO_10 = 10;
    int VIT_PCMN_11 = 11;

    Perso hero = Perso(
        atk: 0,
        augmentationStatParNiveau: 0,
        def: 1000,
        pv: 1000,
        vit: VIT_HERO_10,
        x: 0,
        y: 0);
    hero.attaque1 = Attaque(
      hero: hero,
      ppMax: 1000,
      nom: "rien",
      description: "attaque rien",
      effet: (Perso perso, Pacomon pacomon) {},
    );

    Pacomon pacomon = Pacomon(
        atk: 0,
        categorie: '',
        def: 1000,
        exp: 0,
        nom: '',
        pathImage: '',
        pv: 1000,
        rarete: 0,
        vit: VIT_PCMN_11);
    Combat combat = Combat(hero: hero, pacomon: pacomon);
    combat.start();
    expect(combat.etatCombat, TypeMatcher<EtatCombatPacomonApparait>());
    combat.whenOrder(ordre: EnumOrdre.A);

    // a qui le tour : pcmn
    expect(combat.etatCombat, TypeMatcher<EtatCombatPacomonVaAttaquer>());
    combat.whenOrder(ordre: EnumOrdre.A);
    expect(combat.etatCombat, TypeMatcher<EtatCombatPacomonAttaque>());
    combat.whenOrder(ordre: EnumOrdre.A);
    // a qui le tour : hero
    expect(combat.etatCombat, TypeMatcher<EtatCombatChoisirAction>());
    combat.whenOrder(ordre: EnumOrdre.A);
    expect(combat.etatCombat, TypeMatcher<EtatCombatChoisirAttaque>());
    combat.whenOrder(ordre: EnumOrdre.A);
    expect(combat.etatCombat, TypeMatcher<EtatCombatHeroVaAttaquer>());

    combat.whenOrder(ordre: EnumOrdre.A);
    // a qui le tour
    expect(combat.etatCombat, TypeMatcher<EtatCombatPacomonVaAttaquer>());
    combat.whenOrder(ordre: EnumOrdre.A);
    expect(combat.etatCombat, TypeMatcher<EtatCombatPacomonAttaque>());
    combat.whenOrder(ordre: EnumOrdre.A);
    expect(combat.etatCombat, TypeMatcher<EtatCombatChoisirAction>());
  }, tags: "t");
  testWidgets('hero est deux fois plus rapide que pcmn', (tester) async {
    int VIT_HERO_20 = 20;
    int VIT_PCMN_10 = 10;

    Perso hero = Perso(
        atk: 0,
        augmentationStatParNiveau: 0,
        def: 1000,
        pv: 1000,
        vit: VIT_HERO_20,
        x: 0,
        y: 0);
    hero.attaque1 = Attaque(
      hero: hero,
      ppMax: 1000,
      nom: "rien",
      description: "attaque rien",
      effet: (Perso perso, Pacomon pacomon) {},
    );

    Pacomon pacomon = Pacomon(
        atk: 0,
        categorie: '',
        def: 1000,
        exp: 0,
        nom: '',
        pathImage: '',
        pv: 1000,
        rarete: 0,
        vit: VIT_PCMN_10);
    Combat combat = Combat(hero: hero, pacomon: pacomon);
    combat.start();
    expect(combat.etatCombat, TypeMatcher<EtatCombatPacomonApparait>());
    // a qui le tour
    combat.whenOrder(ordre: EnumOrdre.A);
    expect(combat.etatCombat, TypeMatcher<EtatCombatChoisirAction>());
    combat.whenOrder(ordre: EnumOrdre.A);
    expect(combat.etatCombat, TypeMatcher<EtatCombatChoisirAttaque>());
    combat.whenOrder(ordre: EnumOrdre.A);
    expect(combat.etatCombat, TypeMatcher<EtatCombatHeroVaAttaquer>());
    combat.whenOrder(ordre: EnumOrdre.A);
    // a qui le tour
    expect(combat.etatCombat, TypeMatcher<EtatCombatChoisirAction>());
    combat.whenOrder(ordre: EnumOrdre.A);
    expect(combat.etatCombat, TypeMatcher<EtatCombatChoisirAttaque>());
    combat.whenOrder(ordre: EnumOrdre.A);
    expect(combat.etatCombat, TypeMatcher<EtatCombatHeroVaAttaquer>());

    combat.whenOrder(ordre: EnumOrdre.A);
    // a qui le tour
    expect(combat.etatCombat, TypeMatcher<EtatCombatPacomonVaAttaquer>());
    combat.whenOrder(ordre: EnumOrdre.A);
    expect(combat.etatCombat, TypeMatcher<EtatCombatPacomonAttaque>());
  }, tags: "t");

   testWidgets('pcmn est deux fois plus rapide que hero', (tester) async {
    int VIT_HERO_10 = 10;
    int VIT_PCMN_21 = 21;

    Perso hero = Perso(
        atk: 0,
        augmentationStatParNiveau: 0,
        def: 1000,
        pv: 1000,
        vit: VIT_HERO_10,
        x: 0,
        y: 0);
    hero.attaque1 = Attaque(
      hero: hero,
      ppMax: 1000,
      nom: "rien",
      description: "attaque rien",
      effet: (Perso perso, Pacomon pacomon) {},
    );

    Pacomon pacomon = Pacomon(
        atk: 0,
        categorie: '',
        def: 1000,
        exp: 0,
        nom: '',
        pathImage: '',
        pv: 1000,
        rarete: 0,
        vit: VIT_PCMN_21);
    Combat combat = Combat(hero: hero, pacomon: pacomon);
    combat.start();
    expect(combat.etatCombat, TypeMatcher<EtatCombatPacomonApparait>());
    combat.whenOrder(ordre: EnumOrdre.A);
    // a qui le tour
        expect(combat.etatCombat, TypeMatcher<EtatCombatPacomonVaAttaquer>());
    combat.whenOrder(ordre: EnumOrdre.A);
    expect(combat.etatCombat, TypeMatcher<EtatCombatPacomonAttaque>());
    combat.whenOrder(ordre: EnumOrdre.A);
            expect(combat.etatCombat, TypeMatcher<EtatCombatPacomonVaAttaquer>());
    combat.whenOrder(ordre: EnumOrdre.A);
    expect(combat.etatCombat, TypeMatcher<EtatCombatPacomonAttaque>());
    combat.whenOrder(ordre: EnumOrdre.A);

    expect(combat.etatCombat, TypeMatcher<EtatCombatChoisirAction>());


  }, tags: "t"); 

   testWidgets('combat termine', (tester) async {
    Perso hero = Perso(
        atk: 10000,
        augmentationStatParNiveau: 0,
        def: 1000,
        pv: 1000,
        vit: 1000,
        x: 0,
        y: 0);
    hero.attaque1 = Attaque(
      hero: hero,
      ppMax: 1000,
      nom: "rien",
      description: "attaque rien",
      effet: (Perso perso, Pacomon pacomon) {pacomon.recevoirDegatsNet(perso.atk);},
    );

    Pacomon pacomon = Pacomon(
        atk: 0,
        categorie: '',
        def: 0,
        exp: 0,
        nom: '',
        pathImage: '',
        pv: 2,
        rarete: 0,
        vit: 1);
    Combat combat = Combat(hero: hero, pacomon: pacomon);
    combat.start();
    expect(combat.etatCombat, TypeMatcher<EtatCombatPacomonApparait>());
    combat.whenOrder(ordre: EnumOrdre.A);
    // a qui le tour    combat.whenOrder(ordre: EnumOrdre.A);
    expect(combat.etatCombat, TypeMatcher<EtatCombatChoisirAction>());
    combat.whenOrder(ordre: EnumOrdre.A);
    expect(combat.etatCombat, TypeMatcher<EtatCombatChoisirAttaque>());
    combat.whenOrder(ordre: EnumOrdre.A);
    expect(combat.etatCombat, TypeMatcher<EtatCombatHeroVaAttaquer>());
    expect(TestManager.dernierOrdre, EnumOrdre.RIEN);
    
    combat.whenOrder(ordre: EnumOrdre.A);

    expect(TestManager.dernierOrdre, EnumOrdre.FIN_COMBAT);




  }, tags: "t"); 

}
