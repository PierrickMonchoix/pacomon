import 'package:first_flutter_app/modele/modele_manager.dart';
import 'package:first_flutter_app/presentation/presentation_manager.dart';
import 'package:first_flutter_app/vue/vue_manager.dart';
import 'package:flutter/src/widgets/media_query.dart';
import 'package:flutter/src/widgets/framework.dart';
class GlobalManager {
  
  static late double _widthScreen;

  static double get widthScreen => _widthScreen;

  static Future<void> initialize({required BuildContext context}) async {
    await ModeleManager.initialize();
    PresentationManager.initialize();
    VueManager.initialize();
    _widthScreen = MediaQuery.of(context).size.width;
  }



  

}