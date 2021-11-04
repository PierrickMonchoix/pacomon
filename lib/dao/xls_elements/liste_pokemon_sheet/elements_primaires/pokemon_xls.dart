class PacomonXls {
  String _nom;
  String _pathImage;
  String _rarete;
  String _atk;
  String _def;
  String _pvMax;
 

  String get nom => this._nom;
  String get pathImage => this._pathImage;
  String get rarete => this._rarete;
  String get atk => this._atk;
  String get def => this._def;
  String get pvMax => this._pvMax;

  PacomonXls({required String nom , required String pathImage , required String rarete , required String atk, required String def, required String pvMax}) : _nom = nom , _pathImage = pathImage , _rarete = rarete , _atk = atk , _def = def, _pvMax = pvMax;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is PacomonXls &&
      other._nom == _nom &&
      other._pathImage == _pathImage &&
      other._rarete == _rarete;
  }

  @override
  int get hashCode => _nom.hashCode ^ _pathImage.hashCode ^ _rarete.hashCode;

  @override
  String toString() {
    return 'PacomonXls(_nom: $_nom, _pathImage: $_pathImage, _rarete: $_rarete, _atk: $_atk, _def: $_def, _pvMax: $_pvMax)';
  }
}
