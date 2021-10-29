class ElementTerrainXls {
  final String _id;
  final String _pathImage;
  final String _traversable;
  final String _probaPokemon;



  ElementTerrainXls({required String id , required String pathImage , required String traversable , required String probaPokemon}) : _id = id , _pathImage = pathImage , _traversable = traversable, _probaPokemon = probaPokemon;

  String get id => _id;
  String get pathImage => _pathImage;
  String get traversable => _traversable;
  String get probaPokemon => this._probaPokemon;

  




  @override
  String toString() {
    return 'ElementTerrainXls(_id: $_id, _pathImage: $_pathImage, _traversable: $_traversable, _probaPokemon: $_probaPokemon)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ElementTerrainXls &&
      other._id == _id &&
      other._pathImage == _pathImage &&
      other._traversable == _traversable &&
      other._probaPokemon == _probaPokemon;
  }

  @override
  int get hashCode {
    return _id.hashCode ^
      _pathImage.hashCode ^
      _traversable.hashCode ^
      _probaPokemon.hashCode;
  }
}
