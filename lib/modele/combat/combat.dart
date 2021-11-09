import 'dart:math';

import 'package:pacomon/modele/combat/etat_combat.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_pacomon_apparait.dart';
import 'package:pacomon/modele/etat_jeu/enum_ordre.dart';
import 'package:pacomon/modele/modele_manager.dart';
import 'package:pacomon/modele/pacomon.dart';
import 'package:pacomon/modele/perso.dart';
import 'package:pacomon/test_manager.dart';

class Combat {
  int attaqueSelected = 1;

  Pacomon _pacomon;
  Perso hero;
  late EtatCombat etatCombat;
  bool connecteAuModele = false;

  Pacomon get pacomon => this._pacomon;

  late int reserveVitessePacomon;
  late int reserveVitesseHero;

  Combat(
      {bool connecteAuModele_ = false,
      required Pacomon pacomon,
      required Perso hero})
      : _pacomon = pacomon,
        hero = hero {
    reserveVitesseHero = hero.vit;
    reserveVitessePacomon = pacomon.vit;
    connecteAuModele = connecteAuModele_;
    if (!connecteAuModele) {
      print("ATTENTION : COMBAT NON CONTECTE AU MODEL");
    }
  }

  void finCombat() {
    print("####### fin du combat");
    hero.resetStats();
    if (connecteAuModele) {
      print("####### fin du combat connecteAuModele");
      ModeleManager.sendOrderEtatJeu(EnumOrdre.FIN_COMBAT);
    } else {
      TestManager.dernierOrdre = EnumOrdre.FIN_COMBAT;
    }
  }

  void start() {
    etatCombat = EtatCombatPacomonApparait(combat: this);
  }

  void whenOrder({required EnumOrdre ordre}) {
    etatCombat.whenOrder(ordre);
  }

  bool isTourHero() {
    int faibleVitesse = min(hero.vit, pacomon.vit);
    if (reserveVitesseHero < faibleVitesse &&
        reserveVitessePacomon < faibleVitesse) {
      reserveVitesseHero += hero.vit;
      reserveVitessePacomon += pacomon.vit;
    }

    if (reserveVitesseHero >= reserveVitessePacomon) {
      reserveVitesseHero -= faibleVitesse;
      return true;
    } else {
      reserveVitessePacomon -= faibleVitesse;
      return false;
    }
  }

  void setAndStartEtatCombat(EtatCombat newEtatCombat) {
    etatCombat = newEtatCombat;
    etatCombat.start();
  }

  bool attaqueSelectedHavePp(){
    switch (attaqueSelected) {
      case 1:
        return hero.attaque1.pp > 0 ;
        case 2:
        return hero.attaque2.pp > 0 ;
        case 3:
        return hero.attaque3.pp > 0 ;
        case 4:
        return hero.attaque4.pp > 0 ;
      default: return false;
    }
  }

  void heroAttaquePacomon() {
    if (hero.plusDePp()) {
      hero.lutte.executeOn(_pacomon);
    } else {
      switch (attaqueSelected) {
        case 1:
          hero.attaquerPacomonWithAttaque1(_pacomon);
          break;
        case 2:
          hero.attaquerPacomonWithAttaque2(_pacomon);
          break;
        case 3:
          hero.attaquerPacomonWithAttaque3(_pacomon);
          break;
        case 4:
          hero.attaquerPacomonWithAttaque4(_pacomon);
          break;
        default:
      }
    }
  }

  void heroAttaquePacomonAvecLutte() {}

  void pacomonAttaqueHero() {
    pacomon.attaquerPerso(hero);
  }

  void selectAttaqueBas() {
    switch (attaqueSelected) {
      case 1:
        attaqueSelected = 3;
        break;
      case 2:
        attaqueSelected = 4;
        break;
      default:
    }
  }

  void selectAttaqueHaut() {
    switch (attaqueSelected) {
      case 3:
        attaqueSelected = 1;
        break;
      case 4:
        attaqueSelected = 2;
        break;
      default:
    }
  }

  void selectAttaqueDroite() {
    switch (attaqueSelected) {
      case 1:
        attaqueSelected = 2;
        break;
      case 3:
        attaqueSelected = 4;
        break;
      default:
    }
  }

  void selectAttaqueGauche() {
    switch (attaqueSelected) {
      case 2:
        attaqueSelected = 1;
        break;
      case 4:
        attaqueSelected = 3;
        break;
      default:
    }
  }
}
