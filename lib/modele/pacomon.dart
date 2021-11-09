
import 'dart:math';

import 'package:pacomon/modele/modele_manager.dart';
import 'package:pacomon/modele/perso.dart';
import 'package:pacomon/modele/unite.dart';

class Pacomon extends AUnite {
  void attaquerPerso(Perso perso) {
    perso.recevoirDegatsNet(atk);
  }

  String _nom = "NOT_SET";
  String _pathImage = "assets/for_run/image_not_set.png";
  double _rarete = 0.0;
  String _categorie = "NOT_SET";
  int _exp;

  String get nom => this._nom;
  String get pathImage => this._pathImage;
  double get rarete => this._rarete;
  String get categorie => this._categorie;
  int get exp => this._exp;

  //Pokemon.vide();
  Pacomon(
      {required String nom,
      required String pathImage,
      required double rarete,
      required int pv,
      required int atk,
      required int def,
      required String categorie,
      required int exp,
      required int vit
      })
      : 
      _exp = exp,
      _nom = nom,
        _pathImage = pathImage,
        _rarete = rarete,
        _categorie = categorie,
        super(pv: pv, atk: atk, def: def, vit : vit);

  Pacomon.fromOther(Pacomon pacomon)
      : _nom = pacomon.nom,
        _pathImage = pacomon.pathImage,
        _rarete = pacomon.rarete,
        _categorie = pacomon.categorie,
        _exp = pacomon._exp,
        super(atk: pacomon.atk, def: pacomon.def, pv: pacomon.pv , vit: pacomon.vit);




  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Pacomon &&
      other._nom == _nom &&
      other._pathImage == _pathImage &&
      (other._rarete - _rarete).abs() < ModeleManager.epsilonProbas &&
      other._categorie == _categorie &&
      other.def == def &&
      other.pvMax == pvMax &&
      other.atk == atk  &&
      other.vit == vit;
  }

  @override
  int get hashCode {
    return _nom.hashCode ^
      _pathImage.hashCode ^
      _rarete.hashCode ^
      _categorie.hashCode;
  }

  @override
  String toString() {
    return 'Pacomon(_nom: $_nom, _pathImage: $_pathImage, _rarete: $_rarete, _categorie: $_categorie, _exp: $_exp , vit: $vit)';
  }
}
