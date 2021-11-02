import 'package:pacomon/modele/modele_manager.dart';
import 'package:pacomon/vue/vue_manager.dart';
import 'package:flutter/src/widgets/media_query.dart';
import 'package:flutter/src/widgets/framework.dart';
class GlobalManager {
  
  static late double _widthScreen;

  static double get widthScreen => _widthScreen;

  static Future<void> initialize({required BuildContext context}) async {
    _widthScreen = MediaQuery.of(context).size.width;
    await ModeleManager.initialize();
    await VueManager.initialize();
    _widthScreen = MediaQuery.of(context).size.width;
  }



  

}