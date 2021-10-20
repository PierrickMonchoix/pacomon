import 'package:flutter_test/flutter_test.dart';
import 'package:first_flutter_app/manage_xls_data.dart';


void main() {
  testWidgets('manage xls data ...', (tester) async {
    int result = 0;

    result = await ManageXlsData.getPrimaryData();

    expect(result , 13);
  });
}