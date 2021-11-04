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
      required int def})
      : _x = x,
        _y = y,
        super(pv: pv, atk: atk, def: def) {
    attaque1 = Attaque(
        nom: "rien 1", perso: this, effet: (Perso perso, Pacomon pacomon) {});
    attaque2 = Attaque(
        nom: "rien 2", perso: this, effet: (Perso perso, Pacomon pacomon) {});
    attaque3 = Attaque(
        nom: "rien 3", perso: this, effet: (Perso perso, Pacomon pacomon) {});
    attaque4 = Attaque(
        nom: "rien 4", perso: this, effet: (Perso perso, Pacomon pacomon) {});
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
    _isPacomonInNextElementTerrain(nextBloc: nextBloc);
    if (nextBloc.traversable) {
      _y--;
    }
  }

  void marcheBas() {
    ElementTerrain nextBloc =
        ModeleManager.carte.getElementTerrainFromCoord(y: _y + 1, x: _x);
    _isPacomonInNextElementTerrain(nextBloc: nextBloc);
    if (nextBloc.traversable) {
      _y++;
    }
  }

  void marcheGauche() {
    ElementTerrain nextBloc =
        ModeleManager.carte.getElementTerrainFromCoord(y: _y, x: _x - 1);
    _isPacomonInNextElementTerrain(nextBloc: nextBloc);
    if (nextBloc.traversable) {
      _x--;
    }
  }

  void marcheDroite() {
    ElementTerrain nextBloc =
        ModeleManager.carte.getElementTerrainFromCoord(y: _y, x: _x + 1);
    _isPacomonInNextElementTerrain(nextBloc: nextBloc);
    if (nextBloc.traversable) {
      _x++;
    }
  }

  int expNecessaire(){
    return 10 * pow(niveau,2).toInt();
  }

  void _gagnerNiveau(){
    niveau ++;
    pv += pvMax ~/ 10;
    pvMax += pvMax ~/ 10;
    atk += atk ~/ 10;
  }

  void gagnerExp(int expGagnee){
    exp += expGagnee;
    while(exp >= expNecessaire()){
      exp -= expNecessaire();
      _gagnerNiveau();
    }
  }
}
