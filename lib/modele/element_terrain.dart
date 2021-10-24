class ElementTerrain {
  // > FOR VIEW

  String? _pathImage;

  // < FOR VIEW

  String? _nom;
  bool? _traversable;

  ElementTerrain();

  bool? get traversable => _traversable;
  set traversable(bool? value) => _traversable = value;

  String? get pathImage => _pathImage;
  set pathImage(String? value) => _pathImage = value;

  String? get nom => _nom;
  set nom(String? value) => _nom = value;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ElementTerrain &&
      other._pathImage == _pathImage &&
      other._nom == _nom &&
      other._traversable == _traversable;
  }

  @override
  int get hashCode => _pathImage.hashCode ^ _nom.hashCode ^ _traversable.hashCode;
}
