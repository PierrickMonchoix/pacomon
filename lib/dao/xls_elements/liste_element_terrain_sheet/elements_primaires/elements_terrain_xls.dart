class ElementTerrainXls {
  final String _id;
  final String _pathImage;
  final String _traversable;
  final String _probaPacomon;
  final String _categorie;
  final String interaction;



  ElementTerrainXls({required String interaction, required String id , required String pathImage , required String traversable , required String probaPacomon , required String categorie}) : _id = id , _pathImage = pathImage , _traversable = traversable, _probaPacomon = probaPacomon , _categorie = categorie , interaction = interaction;

  String get id => _id;
  String get pathImage => _pathImage;
  String get traversable => _traversable;
  String get probaPacomon => this._probaPacomon;
  String get categorie => this._categorie;

  

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ElementTerrainXls &&
      other._id == _id &&
      other._pathImage == _pathImage &&
      other._traversable == _traversable &&
      other._probaPacomon == _probaPacomon &&
      other._categorie == _categorie &&
      other.interaction == interaction
      
      ;
  }

  @override
  int get hashCode {
    return _id.hashCode ^
      _pathImage.hashCode ^
      _traversable.hashCode ^
      _probaPacomon.hashCode ^
      _categorie.hashCode;
  }

  @override
  String toString() {
    return 'ElementTerrainXls(_id: $_id, _pathImage: $_pathImage, _traversable: $_traversable, _probaPacomon: $_probaPacomon, _categorie: $_categorie)';
  }
}
