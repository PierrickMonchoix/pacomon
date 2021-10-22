class IdElementTerrainXls {
  final String _id;

  IdElementTerrainXls({required String id}) : _id = id ;

  get id => _id;

  


  @override
  String toString() => 'IdElementTerrainXls(_id: $_id)';

  bool equals(IdElementTerrainXls other){
    return other.id == _id;
  }

  @override
  int get hashCode => _id.hashCode;
}
