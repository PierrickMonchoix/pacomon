import 'package:pacomon/modele/combat/combat.dart';
import 'package:pacomon/modele/element_terrain.dart';
import 'package:pacomon/modele/etat_jeu/enum_ordre.dart';
import 'package:pacomon/modele/etat_jeu/etat_jeu.dart';
import 'package:pacomon/modele/etat_jeu/les_etats_jeu/etat_jeu_marche.dart';
import 'package:pacomon/modele/modele_manager.dart';

class EtatJeuCombat implements EtatJeu{

  EtatJeuCombat() : super(){
    
  }

  @override
  void whenOrder(EnumOrdre ordre) {
    ModeleManager.combat.etatCombat.whenOrder(ordre);
  }

  @override
  void start() {
    ElementTerrain terrainOuEstHEro = ModeleManager.carte.getElementTerrainFromCoord(y: ModeleManager.perso.y, x: ModeleManager.perso.x);
    ModeleManager.combat = Combat(pacomon: ModeleManager.listePokemon.getRandomPacomon( terrainOuEstHEro.categorie ));
    ModeleManager.combat.start();
  }


  
}

