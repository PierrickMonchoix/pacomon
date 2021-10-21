import 'element_decort.dart';

class MapModel {

  static const int size = 5;
  List<List<ElementDecort>> matrice = [];

  MapModel() {
    matrice = List.generate(size, (i) => List.generate(size, (j) => ElementDecort(pathImg: "nopath") ));
  }
}
