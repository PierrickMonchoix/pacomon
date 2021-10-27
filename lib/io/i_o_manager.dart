import 'package:first_flutter_app/io/i_o_listener.dart';
import 'package:first_flutter_app/modele/modele_manager.dart';
import 'package:first_flutter_app/vue/vue_manager.dart';

class IOManager {

  static List<IOListener> _listListener = [ModeleManager() , VueManager()];

  static whenButtonPressed( BoutonsEnum boutonsEnum ){
    for (IOListener listener in _listListener) {
      listener.whenNotify(boutonsEnum);
    }
  }


 }