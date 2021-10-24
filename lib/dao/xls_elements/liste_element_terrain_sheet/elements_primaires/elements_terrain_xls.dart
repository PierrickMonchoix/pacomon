class ElementTerrainXls {
  final String _id;
  final String _pathImage;
  final String _traversable;

  ElementTerrainXls({required String id , required String pathImage , required String traversable}) : _id = id , _pathImage = pathImage , _traversable = traversable;

  get id => _id;
  get pathImage => _pathImage;
  get traversable => _traversable;

  


  @override
  String toString() => 'ElementTerrainXls(_id: $_id, _pathImage: $_pathImage, _traversable: $_traversable)';

 
  bool equals(ElementTerrainXls other) {
    return 
      other._id == _id &&
      other._pathImage == _pathImage &&
      other._traversable == _traversable;
  }

}
