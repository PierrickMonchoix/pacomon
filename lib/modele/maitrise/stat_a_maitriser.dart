import 'package:pacomon/modele/perso.dart';

class StatAmaitriser {
  String nom;
  String description;
  void Function() effetParPoint;

  StatAmaitriser({required String nom , required String description , required void Function() effetParPoint }) : 
    nom = nom , description = description , effetParPoint = effetParPoint;

  

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is StatAmaitriser &&
      other.nom == nom &&
      other.description == description;
  }

  @override
  int get hashCode => nom.hashCode ^ description.hashCode;
}
