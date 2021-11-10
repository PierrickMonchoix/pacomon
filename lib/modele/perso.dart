import 'package:pacomon/modele/attaque/attaque.dart';
import 'package:pacomon/modele/carte.dart';
import 'package:pacomon/modele/element_terrain/element_terrain.dart';
import 'package:pacomon/modele/element_terrain/enum_interaction.dart';
import 'package:pacomon/modele/etat_jeu/enum_ordre.dart';
import 'package:pacomon/modele/interaction.dart';
import 'package:pacomon/modele/liste_pokemon.dart';
import 'package:pacomon/modele/maitrise/maitrise.dart';
import 'package:pacomon/modele/modele_manager.dart';
import 'dart:math';

import 'package:pacomon/modele/pacomon.dart';
import 'package:pacomon/modele/unite.dart';



class Perso extends AUnite {

  int niveau = 1;
  int exp = 0;

  late Attaque attaque1;
  late Attaque attaque2;
  late Attaque attaque3;
  late Attaque attaque4;
  late Attaque lutte;

  int basePvMax;
  int baseAtk;
  int baseDef;
  int baseVit;

  int _x;
  int _y;

  int get x => _x;
  int get y => _y;

  late Maitrise maitrise;

  Perso(
      {required int x,
      required int y,
      required int pv,
      required int atk,
      required int def,
      required int vit,
      })
      : 
      basePvMax = pv,
      baseAtk = atk,
      baseDef = def,
      baseVit = vit,

      _x = x,
        _y = y,
        super(pv: pv, atk: atk, def: def, vit: vit) ;

  
  void resetStats(){
    pvMax = basePvMax;
    atk = baseAtk;
    def = baseDef;
    vit = baseVit;
  }

  void attaquerPacomonWithAttaque1(Pacomon pacomon) {
    attaque1.executeOn(pacomon);
  }

  void attaquerPacomonWithAttaque2(Pacomon pacomon) {
    attaque2.executeOn(pacomon);
  }

  void attaquerPacomonWithAttaque3(Pacomon pacomon) {
    attaque3.executeOn(pacomon);
  }

  void attaquerPacomonWithAttaque4(Pacomon pacomon) {
    attaque4.executeOn(pacomon);
  }

  void _isPacomonInNextElementTerrain({required ElementTerrain nextBloc}) {
    if (nextBloc.probaPacomon > ModeleManager.epsilonProbas) {
      Random random = Random();
      double randomDouble = random.nextDouble();
      if (randomDouble < nextBloc.probaPacomon) {
        ModeleManager.sendOrderEtatJeu(EnumOrdre.DEMARRER_COMBAT);
      }
    }
    
  }

  void marcheHaut() {
    ElementTerrain nextBloc =
        ModeleManager.carte.getElementTerrainFromCoord(y: _y - 1, x: _x);
    if (nextBloc.traversable) {
      _y--;
      _isPacomonInNextElementTerrain(nextBloc: nextBloc);
    }
    
  }

  void marcheBas() {
    ElementTerrain nextBloc =
        ModeleManager.carte.getElementTerrainFromCoord(y: _y + 1, x: _x);
    if (nextBloc.traversable) {
      _y++;
       _isPacomonInNextElementTerrain(nextBloc: nextBloc);
    }
   
  }

  void marcheGauche() {
    ElementTerrain nextBloc =
        ModeleManager.carte.getElementTerrainFromCoord(y: _y, x: _x - 1);
    if (nextBloc.traversable) {
      _x--;
      _isPacomonInNextElementTerrain(nextBloc: nextBloc);
    }
    
  }

  void marcheDroite() {
    ElementTerrain nextBloc =
        ModeleManager.carte.getElementTerrainFromCoord(y: _y, x: _x + 1);
    if (nextBloc.traversable) {
      _x++;
      _isPacomonInNextElementTerrain(nextBloc: nextBloc);
    }
    
  }

  int expNecessaire(){
    return 10 * pow(niveau,2).toInt();
  }

  void _gagnerNiveau(){
    niveau ++;
    /* pv += (pvMax / augmentationStatParNiveau).floor();
    pvMax += (pvMax / augmentationStatParNiveau).floor();
    atk += (atk / augmentationStatParNiveau).floor();
    vit += (vit / augmentationStatParNiveau).floor();  */
    maitrise.pointsAatributer += maitrise.pointGagneParNiveau;
  }

  void gagnerExp(int expGagnee){
    exp += expGagnee;
    while(exp >= expNecessaire()){
      exp -= expNecessaire();
      _gagnerNiveau();
    }
  }

  bool plusDePp(){
    return(attaque1.pp == 0 && attaque2.pp == 0 && attaque3.pp == 0 && attaque4.pp == 0);
  }

  void guerison(){
    pv = pvMax;
    attaque1.pp = attaque1.ppMax;
    attaque2.pp = attaque2.ppMax;
    attaque3.pp = attaque3.ppMax;
    attaque4.pp = attaque4.ppMax;
  }

  void chercherInteragirAvecTerrain(){
    ElementTerrain blocHaut =
        ModeleManager.carte.getElementTerrainFromCoord(y: _y - 1 , x: _x );
        ElementTerrain blocBas =
        ModeleManager.carte.getElementTerrainFromCoord(y: _y + 1 , x: _x );
        ElementTerrain blocGauche =
        ModeleManager.carte.getElementTerrainFromCoord(y: _y  , x: _x - 1 );
        ElementTerrain blocDroit =
        ModeleManager.carte.getElementTerrainFromCoord(y: _y , x: _x + 1 );
    List<ElementTerrain> listElementTerrain = [blocHaut , blocBas , blocGauche , blocDroit];
    for (ElementTerrain elem in listElementTerrain) {
      if(elem.interaction == EnumIntercationElementTerrain.CENTRE_PACOMON){
        ModeleManager.interaction = Interaction(phraseAcceuil: "Vous avez été soigné !" , effet: (){guerison();});
        ModeleManager.etatJeu.whenOrder(EnumOrdre.INTERAGIR);
      }
    }
  }
}
