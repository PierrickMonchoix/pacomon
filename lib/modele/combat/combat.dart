import 'package:pacomon/modele/combat/etat_combat.dart';
import 'package:pacomon/modele/combat/les_etats_combat/etat_combat_pacomon_apparait.dart';
import 'package:pacomon/modele/modele_manager.dart';
import 'package:pacomon/modele/pacomon.dart';

class Combat {
  int attaqueSelected = 1;

  Pacomon _pacomon;

  Pacomon get pacomon => this._pacomon;



  Combat({required Pacomon pacomon}) : _pacomon = pacomon;

  EtatCombat etatCombat = EtatCombatPacomonApparait();

  void heroAttaquePacomon() {
    switch (attaqueSelected) {
      case 1:
        ModeleManager.perso.attaquerPacomonWithAttaque1(_pacomon);
        break;
      case 2:
        ModeleManager.perso.attaquerPacomonWithAttaque2(_pacomon);
        break;
      case 3:
        ModeleManager.perso.attaquerPacomonWithAttaque3(_pacomon);
        break;
      case 4:
        ModeleManager.perso.attaquerPacomonWithAttaque4(_pacomon);
        break;
      default:
    }
  }

  void pacomonAttaqueHero(){
    pacomon.attaquerPerso(ModeleManager.perso);
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
