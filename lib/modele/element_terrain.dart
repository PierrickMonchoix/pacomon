class ElementTerrain {
  // > FOR VIEW

  String? _pathImage;

  // < FOR VIEW

  String? _nom;
  bool? _traversable;

  bool? get traversable => _traversable;
  set traversable(bool? value) => _traversable = value;

  String? get pathImage => _pathImage;
  set pathImage(String? value) => _pathImage = value;

  String? get nom => _nom;
  set nom(String? value) => _nom = value;
}
