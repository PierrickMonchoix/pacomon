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

  String get nom => this._nom;
  String get pathImage => this._pathImage;
  double get rarete => this._rarete;

  //Pokemon.vide();
  Pacomon(
      {required String nom,
      required String pathImage,
      required double rarete,
      required int pv,
      required int atk,
      required int def})
      : _nom = nom,
        _pathImage = pathImage,
        _rarete = rarete,
        super(pv: pv, atk: atk, def: def);

  Pacomon.fromOther(Pacomon pacomon)
      : _nom = pacomon.nom,
        _pathImage = pacomon.pathImage,
        _rarete = pacomon.rarete,
        super(atk: pacomon.atk, def: pacomon.def, pv: pacomon.pv);

  @override
  String toString() =>
      'Pokemon(_nom: $_nom, _pathImage: $_pathImage, _rarete: $_rarete)';

  void copy(Pacomon base) {
    _pathImage = base.pathImage;
    _nom = base.nom;
    _rarete = base.rarete;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Pacomon &&
        other._nom == _nom &&
        other._pathImage == _pathImage &&
        (other._rarete - _rarete).abs() < ModeleManager.epsilonProbas;
  }

  @override
  int get hashCode => _nom.hashCode ^ _pathImage.hashCode ^ _rarete.hashCode;
}
