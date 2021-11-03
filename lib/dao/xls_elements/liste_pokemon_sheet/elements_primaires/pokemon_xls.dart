class PacomonXls {
  String _nom;
  String _pathImage;
  String _rarete;
 

  String get nom => this._nom;
  String get pathImage => this._pathImage;
  String get rarete => this._rarete;

  PacomonXls({required String nom , required String pathImage , required String rarete}) : _nom = nom , _pathImage = pathImage , _rarete = rarete;


  @override
  String toString() => 'PacomonXls(_nom: $_nom, _pathImage: $_pathImage, _rarete: $_rarete)';


  

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
}
