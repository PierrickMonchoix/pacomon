class ElementTerrain {
  // > FOR VIEW

  String _pathImage = "assets/for_run/image_not_set.png";

  // < FOR VIEW

  String _nom = "NOT_SET";
  bool _traversable = false;

  ElementTerrain.vide();

  ElementTerrain(
      {required String nom,
      required bool traversable,
      required String pathImage})
      : _nom = nom,
        _traversable = traversable,
        _pathImage = pathImage;

  void setAll(
      {required String nom,
      required bool traversable,
      required String pathImage}) {
    _nom = nom;
    _traversable = traversable;
    _pathImage = pathImage;
  }

  bool get traversable => _traversable;
  set traversable(bool value) => _traversable = value;

  String get pathImage => _pathImage;
  set pathImage(String value) => _pathImage = value;

  String get nom => _nom;
  set nom(String value) => _nom = value;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ElementTerrain &&
        other._pathImage == _pathImage &&
        other._nom == _nom &&
        other._traversable == _traversable;
  }

  @override
  int get hashCode =>
      _pathImage.hashCode ^ _nom.hashCode ^ _traversable.hashCode;

  @override
  String toString() => 'ElementTerrain(_pathImage: $_pathImage, _nom: $_nom, _traversable: $_traversable)';

  void copy(ElementTerrain base){
    _pathImage = base.pathImage;
    _nom = base.nom;
    _traversable = base.traversable;
  }


}
