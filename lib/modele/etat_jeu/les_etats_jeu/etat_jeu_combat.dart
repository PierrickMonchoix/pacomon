import 'package:pacomon/modele/combat/combat.dart';
import 'package:pacomon/modele/element_terrain/element_terrain.dart';
import 'package:pacomon/modele/etat_jeu/enum_ordre.dart';
import 'package:pacomon/modele/etat_jeu/etat_jeu.dart';
import 'package:pacomon/modele/etat_jeu/les_etats_jeu/etat_jeu_marche.dart';
import 'package:pacomon/modele/modele_manager.dart';

class EtatJeuCombat implements EtatJeu{

  EtatJeuCombat() : super(){
    
  }

  @override
  void whenOrder(EnumOrdre ordre) {
    switch (ordre) {
      case EnumOrdre.FIN_COMBAT:
        ModeleManager.etatJeu = EtatJeuMarche();
        break;
      default:
      ModeleManager.combat.etatCombat.whenOrder(ordre);
    }
    
  }

  @override
  void start() {
    ElementTerrain terrainOuEstHEro = ModeleManager.carte.getElementTerrainFromCoord(y: ModeleManager.hero.y, x: ModeleManager.hero.x);
    ModeleManager.combat = Combat(  connecteAuModele_: true, hero: ModeleManager.hero, pacomon: ModeleManager.listePokemon.getRandomPacomon( terrainOuEstHEro.categorie ));
    ModeleManager.combat.start();
  }


  
}

