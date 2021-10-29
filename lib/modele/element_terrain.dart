import 'package:first_flutter_app/modele/modele_manager.dart';

class ElementTerrain {
  // > FOR VIEW

  String _pathImage = "assets/for_run/image_not_set.png";

  // < FOR VIEW

  String _nom = "NOT_SET";
  bool _traversable = false;
  double _probaPokemon = 0.0;

  ElementTerrain.vide();

  ElementTerrain.noir() : _pathImage = "assets/for_alex/noir.png";

  ElementTerrain(
      {required String nom,
      required bool traversable,
      required String pathImage,
      required double probaPokemon})
      : _nom = nom,
        _traversable = traversable,
        _pathImage = pathImage,
        _probaPokemon = probaPokemon;

/*   void setAll(
      {required String nom,
      required bool traversable,
      required String pathImage}) {
    _nom = nom;
    _traversable = traversable;
    _pathImage = pathImage;
  } */

  bool get traversable => _traversable;
  set traversable(bool value) => _traversable = value;

  String get pathImage => _pathImage;
  set pathImage(String value) => _pathImage = value;

  String get nom => _nom;
  set nom(String value) => _nom = value;

  double get probaPokemon => this._probaPokemon;
  set probaPokemon(double value) => this._probaPokemon = value;



  void copy(ElementTerrain base) {
    _pathImage = base.pathImage;
    _nom = base.nom;
    _traversable = base.traversable;
    _probaPokemon = base.probaPokemon;
  }

  @override
  String toString() {
    return 'ElementTerrain(_pathImage: $_pathImage, _nom: $_nom, _traversable: $_traversable, _probaPokemon: $_probaPokemon)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ElementTerrain &&
      other._pathImage == _pathImage &&
      other._nom == _nom &&
      other._traversable == _traversable &&
      (other._probaPokemon - _probaPokemon).abs() < ModeleManager.epsilonProbas;
  }

  @override
  int get hashCode {
    return _pathImage.hashCode ^
      _nom.hashCode ^
      _traversable.hashCode ^
      _probaPokemon.hashCode;
  }
}
