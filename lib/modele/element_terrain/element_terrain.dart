import 'package:pacomon/modele/element_terrain/enum_interaction.dart';
import 'package:pacomon/modele/modele_manager.dart';

class ElementTerrain {

  

  // > FOR VIEW

  String _pathImage = "assets/for_run/image_not_set.png";

  // < FOR VIEW

  String _nom = "NOT_SET";
  bool _traversable = false;
  double _probaPacomon = 0.0;
  String categorie = "NOT_SET";
  EnumIntercationElementTerrain interaction =  EnumIntercationElementTerrain.RIEN;
  


  ElementTerrain.vide();

  ElementTerrain.noir() : _pathImage = "assets/for_alex/noir.png";

  ElementTerrain(
      {required String nom,
      required bool traversable,
      required String pathImage,
      required double probaPacomon,
      required String categorie,
      required EnumIntercationElementTerrain intercationElementTerrain
      })
      : _nom = nom,
        _traversable = traversable,
        _pathImage = pathImage,
        _probaPacomon = probaPacomon,
        categorie = categorie,
        interaction = intercationElementTerrain
        ;

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

  double get probaPacomon => this._probaPacomon;
  set probaPacomon(double value) => this._probaPacomon = value;



  void copy(ElementTerrain base) {
    _pathImage = base.pathImage;
    _nom = base.nom;
    _traversable = base.traversable;
    _probaPacomon = base.probaPacomon;
  }

  @override
  String toString() {
    return 'ElementTerrain(_pathImage: $_pathImage, _nom: $_nom, _traversable: $_traversable, _probaPacomon: $_probaPacomon, categorie: $categorie)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ElementTerrain &&
      other._pathImage == _pathImage &&
      other._nom == _nom &&
      other._traversable == _traversable &&
      other.interaction == interaction &&
      (other._probaPacomon - _probaPacomon).abs() < ModeleManager.epsilonProbas;
  }

  @override
  int get hashCode {
    return _pathImage.hashCode ^
      _nom.hashCode ^
      _traversable.hashCode ^
      _probaPacomon.hashCode;
  }
}
