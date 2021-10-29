import 'package:first_flutter_app/modele/modele_manager.dart';

class Pokemon {



  String _nom = "NOT_SET";
  String _pathImage = "assets/for_run/image_not_set.png";
  double _rarete = 0.0;

  String get nom => this._nom;
  String get pathImage => this._pathImage;
  double get rarete => this._rarete;

  Pokemon.vide();
  Pokemon({required String nom, required String pathImage , required double rarete}) : _nom = nom , _pathImage = pathImage , _rarete = rarete;




  @override
  String toString() => 'Pokemon(_nom: $_nom, _pathImage: $_pathImage, _rarete: $_rarete)';



    void copy(Pokemon base){
    _pathImage = base.pathImage;
    _nom = base.nom;
    _rarete = base.rarete;
  }



  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Pokemon &&
      other._nom == _nom &&
      other._pathImage == _pathImage &&
      (other._rarete - _rarete).abs() < ModeleManager.epsilonProbas;
  }

  @override
  int get hashCode => _nom.hashCode ^ _pathImage.hashCode ^ _rarete.hashCode;
}
