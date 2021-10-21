import 'element_decort.dart';

class MapModel {

  int size;
  List<List<ElementDecort>> matrice = [];

  MapModel(this.size) {
    matrice = List.generate(size, (i) => List.generate(size, (j) => ElementDecort(pathImg: "nopath") ));
  }
}
