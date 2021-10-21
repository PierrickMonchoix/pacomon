import 'package:first_flutter_app/map_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:first_flutter_app/manage_xls_data.dart';


void main() {
  testWidgets('manage xls data ...', (tester) async {
    int result = 0;

    result = await ManageXlsData.getPrimaryData();

    MapModel mapModel = await ManageXlsData.getData();

    for (var i = 0; i < MapModel.size; i++) {
      print("\n");
      for (var j = 0; j < MapModel.size; j++) {
          print(mapModel.matrice[i][j].pathImg);
    }
    }

    expect(result , 13);
  }, tags: "test_it");
}