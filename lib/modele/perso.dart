import 'package:pacomon/modele/attaque/attaque.dart';
import 'package:pacomon/modele/carte.dart';
import 'package:pacomon/modele/element_terrain.dart';
import 'package:pacomon/modele/etat_jeu/enum_ordre.dart';
import 'package:pacomon/modele/liste_pokemon.dart';
import 'package:pacomon/modele/modele_manager.dart';
import 'dart:math';

import 'package:pacomon/modele/pacomon.dart';
import 'package:pacomon/modele/unite.dart';



class Perso extends AUnite {

  int niveau = 1;
  int exp = 0;
  double augmentationStatParNiveau;

  late Attaque attaque1;
  late Attaque attaque2;
  late Attaque attaque3;
  late Attaque attaque4;

  int _x;
  int _y;

  int get x => _x;
  int get y => _y;


  Perso(
      {required int x,
      required int y,
      required int pv,
      required int atk,
      required int def,
      required double augmentationStatParNiveau,
      required int vit,
      })
      : 
      augmentationStatParNiveau = augmentationStatParNiveau,
      _x = x,
        _y = y,
        super(pv: pv, atk: atk, def: def, vit: vit) ;

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
    pv += (pvMax / augmentationStatParNiveau).floor();
    pvMax += (pvMax / augmentationStatParNiveau).floor();
    atk += (atk / augmentationStatParNiveau).floor();
  }

  void gagnerExp(int expGagnee){
    exp += expGagnee;
    while(exp >= expNecessaire()){
      exp -= expNecessaire();
      _gagnerNiveau();
    }
  }
}
