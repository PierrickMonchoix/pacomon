import 'package:first_flutter_app/modele/modele_manager.dart';
import 'package:first_flutter_app/presentation/presentation_manager.dart';
import 'package:first_flutter_app/vue/vue_manager.dart';

class GlobalManager {

  static Future<void> initialize() async {
    await ModeleManager.initialize();
    PresentationManager.initialize();
    VueManager.initialize();
  }

}