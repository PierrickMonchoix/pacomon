import 'package:pacomon/io/i_o_listener.dart';
import 'package:pacomon/modele/modele_manager.dart';
import 'package:pacomon/vue/vue_manager.dart';

class IOManager {

  static List<IOListener> _listListener = [ModeleManager() , VueManager()];

  static whenButtonPressed( BoutonsEnum boutonsEnum ){
    for (IOListener listener in _listListener) {
      listener.whenNotify(boutonsEnum);
    }
  }


 }