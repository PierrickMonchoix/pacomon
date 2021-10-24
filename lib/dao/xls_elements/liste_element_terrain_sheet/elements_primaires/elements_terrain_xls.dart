class ElementTerrainXls {
  final String _id;
  final String _pathImage;
  final String _traversable;

  ElementTerrainXls({required String id , required String pathImage , required String traversable}) : _id = id , _pathImage = pathImage , _traversable = traversable;

  String get id => _id;
  String get pathImage => _pathImage;
  String get traversable => _traversable;

  


  @override
  String toString() => 'ElementTerrainXls(_id: $_id, _pathImage: $_pathImage, _traversable: $_traversable)';

 
  bool equals(ElementTerrainXls other) {
    return 
      other._id == _id &&
      other._pathImage == _pathImage &&
      other._traversable == _traversable;
  }


  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ElementTerrainXls &&
      other._id == _id &&
      other._pathImage == _pathImage &&
      other._traversable == _traversable;
  }

  @override
  int get hashCode => _id.hashCode ^ _pathImage.hashCode ^ _traversable.hashCode;
}
